/**
 * (c) Michel Weststrate 2015 - 2016
 * MIT Licensed
 *
 * Welcome to the mobx sources! To get an global overview of how MobX internally works,
 * this is a good place to start:
 * https://medium.com/@mweststrate/becoming-fully-reactive-an-in-depth-explanation-of-mobservable-55995262a254#.xvbh6qd74
 *
 * Source folders:
 * ===============
 *
 * - api/     Most of the public static methods exposed by the module can be found here.
 * - core/    Implementation of the MobX algorithm; atoms, derivations, reactions, dependency trees, optimizations. Cool stuff can be found here.
 * - types/   All the magic that is need to have observable objects, arrays and values is in this folder. Including the modifiers like `asFlat`.
 * - utils/   Utility stuff.
 *
 */
export { IObservable, IDepTreeNode } from "./core/observable";
export { Reaction, IReactionPublic, IReactionDisposer } from "./core/reaction";
export { IDerivation, untracked, IDerivationState } from "./core/derivation";
export { IAtom, Atom, BaseAtom } from "./core/atom";
export { useStrict, isStrictModeEnabled, IAction } from "./core/action";
export { spy } from "./core/spy";
export { IComputedValue } from "./core/computedvalue";
export { IEqualsComparer, comparer } from "./types/comparer";
export { asReference, asFlat, asStructure, asMap } from "./types/modifiers-old";
export { IModifierDescriptor, IEnhancer, isModifierDescriptor } from "./types/modifiers";
export { IInterceptable, IInterceptor } from "./types/intercept-utils";
export { IListenable } from "./types/listen-utils";
export { IObjectWillChange, IObjectChange, IObservableObject, isObservableObject } from "./types/observableobject";
export { IValueDidChange, IValueWillChange, IObservableValue, isObservableValue as isBoxedObservable } from "./types/observablevalue";
export { IObservableArray, IArrayWillChange, IArrayWillSplice, IArrayChange, IArraySplice, isObservableArray } from "./types/observablearray";
export { IKeyValueMap, ObservableMap, IMapEntries, IMapEntry, IMapWillChange, IMapChange, IMapChangeUpdate, IMapChangeAdd, IMapChangeBase, IMapChangeDelete, isObservableMap, map, IObservableMapInitialValues, IMap } from "./types/observablemap";
export { transaction } from "./api/transaction";
export { observable, IObservableFactory, IObservableFactories } from "./api/observable";
export { computed, IComputed, IComputedValueOptions } from "./api/computed";
export { isObservable } from "./api/isobservable";
export { isComputed } from "./api/iscomputed";
export { extendObservable, extendShallowObservable } from "./api/extendobservable";
export { observe } from "./api/observe";
export { intercept } from "./api/intercept";
export { autorun, autorunAsync, when, reaction, IReactionOptions } from "./api/autorun";
export { action, isAction, runInAction, IActionFactory } from "./api/action";
export { expr } from "./api/expr";
export { toJS } from "./api/tojs";
export { ITransformer, createTransformer } from "./api/createtransformer";
export { whyRun, trace } from "./api/whyrun";
export { Lambda, isArrayLike } from "./utils/utils";
export { Iterator } from "./utils/iterable";
export { IObserverTree, IDependencyTree } from "./api/extras";
import { resetGlobalState, shareGlobalState, getGlobalState, isolateGlobalState } from "./core/globalstate";
import { getDependencyTree, getObserverTree } from "./api/extras";
import { getDebugName, getAtom, getAdministration } from "./types/type-utils";
import { allowStateChanges } from "./core/action";
import { spyReport, spyReportEnd, spyReportStart, isSpyEnabled } from "./core/spy";
import { deepEqual } from "./utils/eq";
import { isComputingDerivation } from "./core/derivation";
import { setReactionScheduler, onReactionError } from "./core/reaction";
import { reserveArrayBuffer } from "./types/observablearray";
import { interceptReads } from "./api/intercept-read";
import { ObservableMap } from "./types/observablemap";
import { IObservableValue } from "./types/observablevalue";
export declare const extras: {
    allowStateChanges: typeof allowStateChanges;
    deepEqual: typeof deepEqual;
    getAtom: typeof getAtom;
    getDebugName: typeof getDebugName;
    getDependencyTree: typeof getDependencyTree;
    getAdministration: typeof getAdministration;
    getGlobalState: typeof getGlobalState;
    getObserverTree: typeof getObserverTree;
    interceptReads: typeof interceptReads;
    isComputingDerivation: typeof isComputingDerivation;
    isSpyEnabled: typeof isSpyEnabled;
    onReactionError: typeof onReactionError;
    reserveArrayBuffer: typeof reserveArrayBuffer;
    resetGlobalState: typeof resetGlobalState;
    isolateGlobalState: typeof isolateGlobalState;
    shareGlobalState: typeof shareGlobalState;
    spyReport: typeof spyReport;
    spyReportEnd: typeof spyReportEnd;
    spyReportStart: typeof spyReportStart;
    setReactionScheduler: typeof setReactionScheduler;
};
import { Reaction } from "./core/reaction";
import { untracked } from "./core/derivation";
import { Atom, BaseAtom } from "./core/atom";
import { useStrict, isStrictModeEnabled } from "./core/action";
import { spy } from "./core/spy";
import { asReference, asFlat, asStructure, asMap } from "./types/modifiers-old";
import { isModifierDescriptor } from "./types/modifiers";
import { isObservableObject } from "./types/observableobject";
import { isObservableArray } from "./types/observablearray";
import { map } from "./types/observablemap";
import { transaction } from "./api/transaction";
import { IObservableFactory, IObservableFactories } from "./api/observable";
import { IComputed } from "./api/computed";
import { isObservable } from "./api/isobservable";
import { isComputed } from "./api/iscomputed";
import { extendObservable, extendShallowObservable } from "./api/extendobservable";
import { observe } from "./api/observe";
import { intercept } from "./api/intercept";
import { autorun, autorunAsync, when, reaction } from "./api/autorun";
import { isAction, runInAction, IActionFactory } from "./api/action";
import { expr } from "./api/expr";
import { toJS } from "./api/tojs";
import { createTransformer } from "./api/createtransformer";
import { whyRun } from "./api/whyrun";
import { isArrayLike } from "./utils/utils";
declare const everything: {
    Reaction: typeof Reaction;
    untracked: typeof untracked;
    Atom: typeof Atom;
    BaseAtom: typeof BaseAtom;
    useStrict: typeof useStrict;
    isStrictModeEnabled: typeof isStrictModeEnabled;
    spy: typeof spy;
    comparer: {
        identity: (a: any, b: any) => boolean;
        structural: (a: any, b: any) => boolean;
        default: (a: any, b: any) => boolean;
    };
    asReference: typeof asReference;
    asFlat: typeof asFlat;
    asStructure: typeof asStructure;
    asMap: typeof asMap;
    isModifierDescriptor: typeof isModifierDescriptor;
    isObservableObject: typeof isObservableObject;
    isBoxedObservable: (x: any) => x is IObservableValue<any>;
    isObservableArray: typeof isObservableArray;
    ObservableMap: typeof ObservableMap;
    isObservableMap: (thing: any) => thing is ObservableMap<any>;
    map: typeof map;
    transaction: typeof transaction;
    observable: IObservableFactory & IObservableFactories & {
        deep: {
            struct<T>(initialValue?: T | undefined): T;
        };
        ref: {
            struct<T>(initialValue?: T | undefined): T;
        };
    };
    computed: IComputed;
    isObservable: typeof isObservable;
    isComputed: typeof isComputed;
    extendObservable: typeof extendObservable;
    extendShallowObservable: typeof extendShallowObservable;
    observe: typeof observe;
    intercept: typeof intercept;
    autorun: typeof autorun;
    autorunAsync: typeof autorunAsync;
    when: typeof when;
    reaction: typeof reaction;
    action: IActionFactory;
    isAction: typeof isAction;
    runInAction: typeof runInAction;
    expr: typeof expr;
    toJS: typeof toJS;
    createTransformer: typeof createTransformer;
    whyRun: typeof whyRun;
    isArrayLike: typeof isArrayLike;
    extras: {
        allowStateChanges: typeof allowStateChanges;
        deepEqual: typeof deepEqual;
        getAtom: typeof getAtom;
        getDebugName: typeof getDebugName;
        getDependencyTree: typeof getDependencyTree;
        getAdministration: typeof getAdministration;
        getGlobalState: typeof getGlobalState;
        getObserverTree: typeof getObserverTree;
        interceptReads: typeof interceptReads;
        isComputingDerivation: typeof isComputingDerivation;
        isSpyEnabled: typeof isSpyEnabled;
        onReactionError: typeof onReactionError;
        reserveArrayBuffer: typeof reserveArrayBuffer;
        resetGlobalState: typeof resetGlobalState;
        isolateGlobalState: typeof isolateGlobalState;
        shareGlobalState: typeof shareGlobalState;
        spyReport: typeof spyReport;
        spyReportEnd: typeof spyReportEnd;
        spyReportStart: typeof spyReportStart;
        setReactionScheduler: typeof setReactionScheduler;
    };
};
export default everything;
