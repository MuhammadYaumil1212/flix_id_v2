// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieDetailHash() => r'2d873c7965fc3bf249defc686b9fd8b78f1c8c79';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [movieDetail].
@ProviderFor(movieDetail)
const movieDetailProvider = MovieDetailFamily();

/// See also [movieDetail].
class MovieDetailFamily extends Family<AsyncValue<DetailMovie?>> {
  /// See also [movieDetail].
  const MovieDetailFamily();

  /// See also [movieDetail].
  MovieDetailProvider call({required Movie movie}) {
    return MovieDetailProvider(movie: movie);
  }

  @override
  MovieDetailProvider getProviderOverride(
    covariant MovieDetailProvider provider,
  ) {
    return call(movie: provider.movie);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieDetailProvider';
}

/// See also [movieDetail].
class MovieDetailProvider extends AutoDisposeFutureProvider<DetailMovie?> {
  /// See also [movieDetail].
  MovieDetailProvider({required Movie movie})
    : this._internal(
        (ref) => movieDetail(ref as MovieDetailRef, movie: movie),
        from: movieDetailProvider,
        name: r'movieDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$movieDetailHash,
        dependencies: MovieDetailFamily._dependencies,
        allTransitiveDependencies: MovieDetailFamily._allTransitiveDependencies,
        movie: movie,
      );

  MovieDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movie,
  }) : super.internal();

  final Movie movie;

  @override
  Override overrideWith(
    FutureOr<DetailMovie?> Function(MovieDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailProvider._internal(
        (ref) => create(ref as MovieDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movie: movie,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<DetailMovie?> createElement() {
    return _MovieDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailProvider && other.movie == movie;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movie.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieDetailRef on AutoDisposeFutureProviderRef<DetailMovie?> {
  /// The parameter `movie` of this provider.
  Movie get movie;
}

class _MovieDetailProviderElement
    extends AutoDisposeFutureProviderElement<DetailMovie?>
    with MovieDetailRef {
  _MovieDetailProviderElement(super.provider);

  @override
  Movie get movie => (origin as MovieDetailProvider).movie;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
