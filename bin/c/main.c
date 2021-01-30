﻿// Generated by HLC 4.1.5 (HL v5)
#define HLC_BOOT
#include <hlc.h>
void fun$init(void);

#include <hlc_main.c>

#ifndef HL_MAKE
#  include <hl/hashes.c>
#  include <hl/functions.c>
#  include <hl/BaseType.c>
#  include <_std/String.c>
#  include <_std/Date.c>
#  include <_std/EReg.c>
#  include <hl/types/ArrayAccess.c>
#  include <hl/types/ArrayBase.c>
#  include <hl/types/ArrayBytes_Int.c>
#  include <hl/types/ArrayBytes_hl_UI16.c>
#  include <hl/types/ArrayBytes_hl_F32.c>
#  include <hl/types/ArrayBytes_Float.c>
#  include <_std/StringBuf.c>
#  include <hl/types/ArrayObj.c>
#  include <haxe/Exception.c>
#  include <hxd/BitmapInnerDataImpl.c>
#  include <hxd/BitmapData.c>
#  include <hxd/CustomCursor.c>
#  include <hxd/Event.c>
#  include <sdl/Window.c>
#  include <haxe/ds/_List/ListNode.c>
#  include <haxe/ds/List.c>
#  include <hxd/Window.c>
#  include <hxd/SceneEvents.c>
#  include <h2d/Object.c>
#  include <h2d/filter/Filter.c>
#  include <h2d/Drawable.c>
#  include <h3d/Vector.c>
#  include <hxsl/ShaderList.c>
#  include <hxsl/Shader.c>
#  include <hxsl/SharedShader.c>
#  include <hxsl/ShaderConst.c>
#  include <haxe/ds/IntMap.c>
#  include <hxsl/ShaderInstance.c>
#  include <h2d/Layers.c>
#  include <h2d/col/Point.c>
#  include <h3d/impl/RenderContext.c>
#  include <h3d/mat/DepthBuffer.c>
#  include <h3d/Indexes.c>
#  include <h3d/impl/MemoryManager.c>
#  include <h3d/impl/Driver.c>
#  include <h3d/impl/_ManagedBuffer/FreeCell.c>
#  include <h3d/impl/ManagedBuffer.c>
#  include <haxe/io/Bytes.c>
#  include <hxd/Pixels.c>
#  include <h3d/mat/Texture.c>
#  include <hxsl/ShaderGlobal.c>
#  include <h3d/mat/Stencil.c>
#  include <h3d/mat/Pass.c>
#  include <h3d/Buffer.c>
#  include <h3d/shader/ShaderBuffers.c>
#  include <h3d/shader/Buffers.c>
#  include <hxsl/ShaderInstanceDesc.c>
#  include <hxsl/AllocGlobal.c>
#  include <hxsl/AllocParam.c>
#  include <hxsl/RuntimeShaderData.c>
#  include <hxsl/RuntimeShader.c>
#  include <haxe/ds/StringMap.c>
#  include <hxsl/SearchMap.c>
#  include <hxsl/Cache.c>
#  include <hxsl/Globals.c>
#  include <h3d/pass/ShaderManager.c>
#  include <h3d/shader/Base2d.c>
#  include <h2d/col/Bounds.c>
#  include <h3d/impl/TextureCache.c>
#  include <haxe/ds/ObjectMap.c>
#  include <h3d/_Engine/TargetTmp.c>
#  include <h3d/Engine.c>
#  include <h2d/RenderContext.c>
#  include <h2d/Mask.c>
#  include <h2d/Scene.c>
#  include <h2d/Camera.c>
#  include <h2d/Interactive.c>
#  include <h3d/scene/Object.c>
#  include <h3d/col/Plane.c>
#  include <h3d/col/Frustum.c>
#  include <h3d/Matrix.c>
#  include <h3d/col/Ray.c>
#  include <h3d/scene/Interactive.c>
#  include <h3d/scene/Light.c>
#  include <h3d/pass/PassObject.c>
#  include <h3d/pass/PassList.c>
#  include <h3d/scene/PassObjects.c>
#  include <h3d/scene/LightSystem.c>
#  include <h3d/scene/_RenderContext/SharedGlobal.c>
#  include <h3d/col/Bounds.c>
#  include <h3d/Camera.c>
#  include <h3d/scene/RenderContext.c>
#  include <hxd/impl/AnyProps.c>
#  include <h3d/pass/Base.c>
#  include <h3d/scene/Renderer.c>
#  include <h3d/Quat.c>
#  include <h3d/scene/Mesh.c>
#  include <h3d/scene/MultiMaterial.c>
#  include <h3d/scene/_Graphics/GPoint.c>
#  include <h3d/shader/LineShader.c>
#  include <h3d/prim/Primitive.c>
#  include <h3d/prim/BigPrimitive.c>
#  include <h3d/scene/Graphics.c>
#  include <h3d/shader/SkinBase.c>
#  include <h3d/anim/Joint.c>
#  include <h3d/anim/_Skin/Influence.c>
#  include <h3d/anim/Skin.c>
#  include <h3d/mat/BaseMaterial.c>
#  include <h3d/shader/Texture.c>
#  include <h3d/shader/NormalMap.c>
#  include <h3d/shader/BaseMesh.c>
#  include <h3d/mat/Material.c>
#  include <h3d/scene/Skin.c>
#  include <h3d/anim/AnimatedObject.c>
#  include <h3d/anim/Animation.c>
#  include <h3d/scene/Scene.c>
#  include <hxd/App.c>
#  include <haxe/MainEvent.c>
#  include <haxe/Timer.c>
#  include <hxd/Timer.c>
#  include <components/physics/RidePoint.c>
#  include <h2d/Text.c>
#  include <h2d/Kerning.c>
#  include <h2d/Tile.c>
#  include <h2d/FontChar.c>
#  include <hxd/Charset.c>
#  include <h2d/Font.c>
#  include <h3d/shader/ColorMatrix.c>
#  include <_std/Xml.c>
#  include <h3d/shader/SignedDistanceField.c>
#  include <h2d/impl/_BatchDrawState/StateEntry.c>
#  include <h2d/impl/BatchDrawState.c>
#  include <h2d/TileLayerContent.c>
#  include <h2d/TileGroup.c>
#  include <h2d/HtmlText.c>
#  include <h2d/GPoint.c>
#  include <h2d/_Graphics/GraphicsContent.c>
#  include <hxd/earcut/EarNode.c>
#  include <hxd/earcut/Earcut.c>
#  include <h2d/Graphics.c>
#  include <components/physics/Stick.c>
#  include <components/physics/ScarfStick.c>
#  include <h2d/Bitmap.c>
#  include <components/sledder/RiderScarf.c>
#  include <components/sledder/RiderBase.c>
#  include <components/stage/Camera.c>
#  include <utils/TableRNG.c>
#  include <hxd/snd/ChannelBase.c>
#  include <hxd/res/Resource.c>
#  include <hxd/snd/Data.c>
#  include <hxd/fs/FileEntry.c>
#  include <hxd/res/Sound.c>
#  include <hxd/snd/ChannelGroup.c>
#  include <hxd/snd/SoundGroup.c>
#  include <hxd/snd/openal/BufferHandle.c>
#  include <hxd/snd/Buffer.c>
#  include <hxd/snd/openal/SourceHandle.c>
#  include <hxd/snd/Source.c>
#  include <hxd/snd/EffectDriver.c>
#  include <hxd/snd/Effect.c>
#  include <hxd/snd/Listener.c>
#  include <hxd/snd/Manager.c>
#  include <hxd/snd/Channel.c>
#  include <hxd/snd/effect/Pitch.c>
#  include <components/managers/Musicplayer.c>
#  include <components/stage/TextInfo.c>
#  include <file/SaveLoad.c>
#  include <components/managers/Simulation.c>
#  include <components/managers/Riders.c>
#  include <components/lines/LineBase.c>
#  include <components/managers/Grid.c>
#  include <components/ui/UIButton.c>
#  include <components/ui/Toolbar.c>
#  include <components/tool/ToolBehavior.c>
#  include <h2d/Console.c>
#  include <h2d/TextInput.c>
#  include <components/stage/LRConsole.c>
#  include <components/stage/Canvas.c>
#  include <_std/Main.c>
#  include <hxd/res/Loader.c>
#  include <hxd/fs/EmbedFileSystem.c>
#  include <_std/Math.c>
#  include <haxe/SysTools.c>
#  include <_std/SysError.c>
#  include <haxe/io/Output.c>
#  include <_std/Sys.c>
#  include <sys/io/FileOutput.c>
#  include <haxe/iterators/ArrayIterator.c>
#  include <components/lines/Accel.c>
#  include <components/lines/Floor.c>
#  include <components/lines/Scenery.c>
#  include <components/lines/Undefined.c>
#  include <hxd/fs/BytesFileEntry.c>
#  include <h2d/Anim.c>
#  include <components/sledder/RiderPart.c>
#  include <components/sledder/Bosh.c>
#  include <components/physics/ScarfPoint.c>
#  include <hxd/res/Image.c>
#  include <hxd/res/ImageInfo.c>
#  include <h3d/col/Point.c>
#  include <haxe/Log.c>
#  include <hl/types/ArrayDyn.c>
#  include <components/tool/ToolFunction.c>
#  include <haxe/format/JsonParser.c>
#  include <haxe/io/Input.c>
#  include <format/gif/Reader.c>
#  include <haxe/io/BytesBuffer.c>
#  include <haxe/io/BytesOutput.c>
#  include <format/mp3/MPEG.c>
#  include <format/tools/BitsInput.c>
#  include <format/mp3/Reader.c>
#  include <haxe/io/Eof.c>
#  include <format/mp3/CLayer.c>
#  include <format/png/Writer.c>
#  include <haxe/io/BytesDataImpl.c>
#  include <format/tga/Reader.c>
#  include <format/wav/Reader.c>
#  include <hxd/impl/Allocator.c>
#  include <h3d/impl/_GlDriver/CompiledAttribute.c>
#  include <h3d/impl/InputNames.c>
#  include <h3d/impl/_GlDriver/CompiledShader.c>
#  include <h3d/impl/_GlDriver/CompiledProgram.c>
#  include <h3d/impl/GlDriver.c>
#  include <h3d/anim/LinearFrame.c>
#  include <h3d/anim/LinearObject.c>
#  include <h3d/anim/LinearAnimation.c>
#  include <h3d/shader/UVDelta.c>
#  include <h3d/anim/_Skin/Permut.c>
#  include <h3d/col/Sphere.c>
#  include <haxe/ds/BalancedTree.c>
#  include <haxe/ds/TreeNode.c>
#  include <haxe/ds/EnumValueMap.c>
#  include <hxsl/GlslOut.c>
#  include <h3d/mat/Defaults.c>
#  include <h3d/shader/Shadow.c>
#  include <h3d/mat/MaterialDatabase.c>
#  include <h3d/mat/MaterialSetup.c>
#  include <h3d/pass/Default.c>
#  include <h3d/pass/Shadows.c>
#  include <h3d/pass/DirShadowMap.c>
#  include <h3d/shader/ScreenShader.c>
#  include <h3d/pass/ScreenFx.c>
#  include <h3d/pass/Border.c>
#  include <h3d/shader/DirShadow.c>
#  include <h3d/pass/Blur.c>
#  include <h3d/pass/DefaultShadowMap.c>
#  include <h3d/scene/fwd/Renderer.c>
#  include <h3d/scene/fwd/LightSystem.c>
#  include <h3d/mat/TextureArray.c>
#  include <h3d/shader/Blur.c>
#  include <h3d/pass/_Border/BorderShader.c>
#  include <h3d/prim/RawPrimitive.c>
#  include <h3d/pass/_Copy/ArrayCopyShader.c>
#  include <h3d/pass/_Copy/CopyShader.c>
#  include <h3d/pass/Copy.c>
#  include <h3d/pass/_CubeCopy/CubeCopyShader.c>
#  include <h3d/pass/SortByMaterial.c>
#  include <h3d/shader/MinMaxShader.c>
#  include <h3d/pass/_HardwarePick/FixedColor.c>
#  include <h3d/prim/Plane2D.c>
#  include <h3d/shader/VertexColorAlpha.c>
#  include <h3d/shader/SkinTangent.c>
#  include <h3d/shader/Skin.c>
#  include <h3d/shader/AmbientLight.c>
#  include <h3d/scene/fwd/DepthPass.c>
#  include <h3d/scene/fwd/NormalPass.c>
#  include <h3d/shader/ColorAdd.c>
#  include <h3d/shader/ColorKey.c>
#  include <h3d/shader/GenTexture.c>
#  include <h3d/shader/CubeMinMaxShader.c>
#  include <h3d/shader/SpecularTexture.c>
#  include <h3d/shader/VolumeDecal.c>
#  include <sys/thread/Lock.c>
#  include <haxe/EntryPoint.c>
#  include <haxe/ValueException.c>
#  include <haxe/_Int64/___Int64.c>
#  include <haxe/MainLoop.c>
#  include <haxe/Resource.c>
#  include <haxe/Serializer.c>
#  include <haxe/_Unserializer/DefaultResolver.c>
#  include <haxe/Unserializer.c>
#  include <haxe/crypto/BaseCode.c>
#  include <haxe/crypto/Base64.c>
#  include <hl/NativeArrayIterator_Int.c>
#  include <hl/NativeArrayIterator_Dynamic.c>
#  include <hl/NativeArrayIterator.c>
#  include <haxe/ds/_StringMap/StringMapKeysIterator.c>
#  include <haxe/io/BytesInput.c>
#  include <haxe/io/FPHelper.c>
#  include <haxe/io/Path.c>
#  include <haxe/iterators/ArrayKeyValueIterator.c>
#  include <haxe/xml/XmlParserException.c>
#  include <haxe/xml/Parser.c>
#  include <haxe/xml/Printer.c>
#  include <haxe/zip/Compress.c>
#  include <haxe/zip/Uncompress.c>
#  include <hl/Mikktspace.c>
#  include <hl/Window.c>
#  include <hl/Button.c>
#  include <hl/WinLog.c>
#  include <hl/types/BytesIterator_Float.c>
#  include <hl/types/BytesKeyValueIterator_Float.c>
#  include <hl/types/BytesIterator_Int.c>
#  include <hl/types/BytesKeyValueIterator_Int.c>
#  include <hl/types/BytesIterator_hl_F32.c>
#  include <hl/types/BytesKeyValueIterator_hl_F32.c>
#  include <hl/types/BytesIterator_hl_UI16.c>
#  include <hl/types/BytesKeyValueIterator_hl_UI16.c>
#  include <hl/types/ArrayDynIterator.c>
#  include <hl/types/ArrayDynKeyValueIterator.c>
#  include <hl/types/ArrayObjIterator.c>
#  include <hl/types/ArrayObjKeyValueIterator.c>
#  include <_std/Std.c>
#  include <hxd/Key.c>
#  include <sdl/GameController.c>
#  include <sdl/Event.c>
#  include <hxd/Pad.c>
#  include <hxd/Save.c>
#  include <hxd/System.c>
#  include <hxd/fmt/bfnt/Reader.c>
#  include <hxd/fmt/bfnt/Writer.c>
#  include <hxd/fmt/fbx/TmpObject.c>
#  include <hxd/fmt/fbx/DefaultMatrixes.c>
#  include <hxd/fmt/fbx/_BaseLibrary/AnimCurve.c>
#  include <hxd/fmt/fbx/BaseLibrary.c>
#  include <hxd/fmt/fbx/Geometry.c>
#  include <hxd/fmt/hmd/AnimationEvent.c>
#  include <hxd/fmt/hmd/AnimationObject.c>
#  include <hxd/fmt/hmd/Animation.c>
#  include <hxd/fmt/hmd/SkinSplit.c>
#  include <hxd/fmt/hmd/Position.c>
#  include <hxd/fmt/hmd/SkinJoint.c>
#  include <hxd/fmt/hmd/Skin.c>
#  include <hxd/fmt/hmd/Model.c>
#  include <hxd/fmt/hmd/Material.c>
#  include <hxd/fmt/hmd/GeometryFormat.c>
#  include <hxd/fmt/hmd/Geometry.c>
#  include <hxd/fmt/hmd/Data.c>
#  include <hxd/fmt/fbx/HMDOut.c>
#  include <hxd/fmt/fbx/Parser.c>
#  include <hxd/fmt/hmd/Writer.c>
#  include <hxd/fs/BytesFileSystem.c>
#  include <hxd/fs/Convert.c>
#  include <hxd/fs/ConvertFBX2HMD.c>
#  include <hxd/fs/Command.c>
#  include <hxd/fs/ConvertWAV2MP3.c>
#  include <hxd/fs/ConvertWAV2OGG.c>
#  include <sys/io/FileInput.c>
#  include <hxd/fs/ConvertTGA2PNG.c>
#  include <hxd/fs/ConvertFNT2BFNT.c>
#  include <hxd/fs/CompressIMG.c>
#  include <hxd/fs/DummyConvert.c>
#  include <hxd/fs/_EmbedFileSystem/EmbedEntry.c>
#  include <hxd/fs/NotFound.c>
#  include <hxd/fs/FileInput.c>
#  include <hxd/impl/ArrayIterator_hxd_snd_Channel.c>
#  include <hxd/res/_Any/SingleFileSystem.c>
#  include <hxd/res/Any.c>
#  include <hxd/res/BitmapFont.c>
#  include <hxd/res/DefaultFont.c>
#  include <hxd/snd/Mp3Data.c>
#  include <hxd/snd/OggData.c>
#  include <hxd/snd/WavData.c>
#  include <hxd/snd/openal/Driver.c>
#  include <hxd/snd/effect/LowPass.c>
#  include <hxd/snd/effect/Reverb.c>
#  include <hxd/snd/effect/ReverbPreset.c>
#  include <hxd/snd/effect/Spatialization.c>
#  include <hxd/snd/openal/LowPassDriver.c>
#  include <hxd/snd/openal/PitchDriver.c>
#  include <hxd/snd/openal/ReverbDriver.c>
#  include <hxd/snd/openal/SpatializationDriver.c>
#  include <hxsl/Error.c>
#  include <hxsl/Tools.c>
#  include <hxsl/BatchShader.c>
#  include <hxsl/_Linker/ShaderInfos.c>
#  include <hxsl/_Linker/AllocatedVar.c>
#  include <hxsl/Linker.c>
#  include <hxsl/Splitter.c>
#  include <hxsl/Dce.c>
#  include <hxsl/Flatten.c>
#  include <hxsl/_Flatten/Alloc.c>
#  include <hxsl/Clone.c>
#  include <hxsl/_Dce/VarDeps.c>
#  include <hxsl/Eval.c>
#  include <hxsl/Printer.c>
#  include <hxsl/Serializer.c>
#  include <hxsl/_Splitter/VarProps.c>
#  include <sdl/Sdl.c>
#  include <_std/Lambda.c>
#  include <_std/Reflect.c>
#  include <_std/StringTools.c>
#  include <hl/_Bytes/Bytes_Impl_.c>
#  include <sys/FileSystem.c>
#  include <_std/Type.c>
#  include <_Xml/XmlType_Impl_.c>
#  include <format/gif/Tools.c>
#  include <format/mp3/CChannelMode.c>
#  include <format/mp3/CEmphasis.c>
#  include <format/mp3/Tools.c>
#  include <format/png/Tools.c>
#  include <format/tools/Deflate.c>
#  include <haxe/_CallStack/CallStack_Impl_.c>
#  include <sys/thread/_Mutex/Mutex_Impl_.c>
#  include <sys/thread/_Deque/Deque_Impl_.c>
#  include <haxe/NativeStackTrace.c>
#  include <haxe/crypto/Md5.c>
#  include <haxe/crypto/Sha1.c>
#  include <haxe/ds/ArraySort.c>
#  include <haxe/xml/_Access/NodeAccess_Impl_.c>
#  include <haxe/xml/_Access/AttribAccess_Impl_.c>
#  include <haxe/xml/_Access/HasNodeAccess_Impl_.c>
#  include <haxe/xml/_Access/Access_Impl_.c>
#  include <hl/_UI/Sentinel_Impl_.c>
#  include <hl/UI.c>
#  include <hxd/File.c>
#  include <hxd/_Pixels/PixelsARGB_Impl_.c>
#  include <hxd/Res.c>
#  include <sdl/_Cursor/Cursor_Impl_.c>
#  include <sdl/_Surface/Surface_Impl_.c>
#  include <hxd/fmt/bfnt/FontParser.c>
#  include <hxd/fmt/fbx/FbxTools.c>
#  include <hxd/fmt/hdr/Reader.c>
#  include <hxd/fs/_LoadedBitmap/LoadedBitmap_Impl_.c>
#  include <hxsl/Tools2.c>
#  include <sdl/GL.c>
#  include <sys/io/File.c>
#  include <hl/init.c>
#  include <hl/reflect.c>
#  include <hl/types.c>
#  include <hl/globals.c>
#endif

void hl_init_hashes();
void hl_init_roots();
void hl_init_types( hl_module_context *ctx );
extern void *hl_functions_ptrs[];
extern hl_type *hl_functions_types[];

// Entry point
void hl_entry_point() {
	hl_module_context ctx;
	hl_alloc_init(&ctx.alloc);
	ctx.functions_ptrs = hl_functions_ptrs;
	ctx.functions_types = hl_functions_types;
	hl_init_types(&ctx);
	hl_init_hashes();
	hl_init_roots();
	fun$init();
}

