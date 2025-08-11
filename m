Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D65265292
	for <regressions@lists.linux.dev>; Mon, 11 Aug 2025 05:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754890330; cv=none; b=i2KZoCUephnmOyg/fehIa0eQnYuqDNCpTZPIEFVXmCNwUMi7mMu/w2mQ5asEBnmv7xQcef2X98FU9efAh7zFXbnoXmv10kPtRSZ8ryYJ8lVcUqxg5TesqPgR+7UOKsknoceR+oKxGjuEpgohLZ9EW9qmKAkHoADvpXU/bADg8zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754890330; c=relaxed/simple;
	bh=3GVy3ksHUF0PCb/TUjF3hH29i8dg5GplUwlN4yWsgjw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=YDEZroqZhs5aWgHETALiAEm67VfoXuAh2LNpj3MlQ3AyH9lHhVJHwj2FZjGbaJqrUyBgJzkukv9dXPcnApJximJMwnG1T3xF7/PI0siNYENN4CrWQe0bvgOY06x/P5A377USiZHygk7EAxvpjynsJtt1p83IIILZwSQv21g2ndY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X0PxYhwZ; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X0PxYhwZ"
Message-ID: <f2b70e6e-bff6-42f3-82a2-81eed892cc30@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754890326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k8n6wtZoH9yZ6Xr+jnhM5nwzkzvEoSukEzYOZ5O15Gg=;
	b=X0PxYhwZ8DliCXSbwLMi6tGf41D4eY2vX4so8+v0WMBaj74AF8lHDWkWqLEPidVRRD2nZC
	dmlK4VPAFZJ8v23zK2sCI9ImIVC2gDQbWKvSQVTt3l40ejFMaAGd4wpcgNxksevTzrFI/k
	rvfdbGlwhW/HjwE5GKXjJfwrv+VOEcs=
Date: Sun, 10 Aug 2025 22:32:02 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Language: en-US
To: Gang.Ba@amd.com
Cc: regressions@lists.linux.dev, amd-gfx@lists.freedesktop.org,
 "Koenig, Christian" <Christian.Koenig@amd.com>, Tong.Liu01@amd.com,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [REGRESSION] Freeze while shutting down Steam inside of gamescope
 after b8adc31cc0ca ("drm/amdgpu: Avoid extra evict-restore,process.").
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello,

On kernel 6.17-rc1, when I try to switch from a Steam session running inside
of gamescope back to SDDM by running `steam -shutdown`, I get this error in my dmesg:

[drm:amdgpu_job_submit [amdgpu]] *ERROR* Trying to push to a killed entity

and it locks up the transition to SDDM. I am able to switch to another TTY console,
but the console with my gamescope session stays frozen on a black screen for
several minutes. I also need to force shutdown my PC with the power button
or else the shutdown process hangs.

I bisected the issue to b8adc31cc0ca ("drm/amdgpu: Avoid extra evict-restore
process."). 

After searching the mailing list, I saw that there was a patch [1]
sent out for a race condition introduced by that commit:

[1]: https://lore.kernel.org/all/20250807084655.1597669-1-Tong.Liu01@amd.com/

That patch does seem to resolve this regression on my rig.

System:
  Host: threadripper Kernel: 6.17.0-rc1-1-git-00001-g6bd866b61c96 arch: x86_64
    bits: 64
  Desktop: KDE Plasma v: 6.4.4 Distro: CachyOS
CPU:
  Info: 64-core model: AMD Ryzen Threadripper 9980X s bits: 64 type: MT MCP
    cache: L2: 64 MiB
  Speed (MHz): avg: 1221 min/max: 1221/5476
Graphics:
  Device-1: Advanced Micro Devices [AMD/ATI] Navi 31 [Radeon RX 7900 XT/7900
    XTX/7900 GRE/7900M] driver: amdgpu v: kernel
  Display: wayland server: X.org v: 1.21.1.18 with: Xwayland v: 24.1.8
    compositor: kwin_wayland driver: X: loaded: amdgpu unloaded: modesetting
    dri: radeonsi gpu: amdgpu resolution: 5120x2160~165Hz
  API: EGL v: 1.5 drivers: kms_swrast,radeonsi,swrast
    platforms: gbm,wayland,x11,surfaceless,device
  API: OpenGL v: 4.6 compat-v: 4.5 vendor: amd mesa v: 25.3.0-devel
    renderer: AMD Radeon RX 7900 XTX (radeonsi navi31 LLVM 20.1.8 DRM 3.64
    6.17.0-rc1-1-git-00001-g6bd866b61c96)
  API: Vulkan v: 1.4.321 drivers: radv,llvmpipe surfaces: N/A
  Info: Tools: api: clinfo, eglinfo, glxinfo, vulkaninfo
    de: kscreen-console,kscreen-doctor wl: wayland-info
    x11: xdpyinfo, xprop, xrandr

Thanks,

Matthew
