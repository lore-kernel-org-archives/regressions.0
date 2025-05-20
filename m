Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A171FF5E3
	for <regressions@lists.linux.dev>; Tue, 20 May 2025 16:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747758173; cv=none; b=L6ffRF8L2iDItombjdFaCUMGO1BefytMYciEy6/PdStOUox0W0TSITgL7xdGggCkuueuNWvtvEqAVehgX+P0swuIFY9atIG9L9/zSNvmTlWyqHMgJD6qGe0EnNbs3msyQeUsnq6XXk0yUXjsTHSSPMnkzID3Lt2tRBaTWTnD8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747758173; c=relaxed/simple;
	bh=OSFWaFcsN5NjFF+/2GsgSB2pvTMkxNpSCGwyaZXb+U0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sl9n/qwEhD3TQ5oj1AsOTxiULVVpB11mB0eukxhbthqpADAdt+DtezdErYloOmVlv3sGMoWD2v3sgF6r8TmQTOYZtdCkeAfCuCIbBo5sUlwqcObQPcUGdTRJaHE1c3VE0OV0ztRj1jG7SG1kZYrCKasdmz952b7jiIwOdCwN29g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIWnxSm/; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIWnxSm/"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-72c47631b4cso4286742a34.1
        for <regressions@lists.linux.dev>; Tue, 20 May 2025 09:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747758170; x=1748362970; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0HWhoEGlvH4UanVLpaHgaFj5uaCvcRqQd2jUejSkZk=;
        b=EIWnxSm/u5WlQ8V+zRcaKOMzMk4dFFcebD8wqlyCTIQoX/PeusIJ1DrSy7q+fe/M+V
         eg7hrsteqomp0u4niwBeaaV8k2ZxCf89CSgsg2rjQV3sHNOFxuwX0/TTPlnBUnQIdmsE
         s2D8Eujivc5XWpa3uJVd4r75Cw4Wll1T67Ugg+3jyP5Ium2VVjg03fLfZ+vjv/WRwNDt
         SmVEek3fUt6+x0pLWbAgASv4Shmn18UgRN5BP8wHHp94/kiwuEe8FLkTW1Ms0l+inJUj
         YlZyp7tCqtl2NsbTWoZtZ4oIxYCuR4KLIUuKb6yJjnWwZSxJFWpcDRjvkoIBuAP5c8rU
         PP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747758170; x=1748362970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0HWhoEGlvH4UanVLpaHgaFj5uaCvcRqQd2jUejSkZk=;
        b=PBjI4OJyBoEEQtA/4HHhuBaybVqo2gr6QlHNey6nBy9ZE+56NjGjHfFmGhIDJSJFCb
         UVu0UWQO4Ql+PkBHnoHpZX9fLCHs0al30oQzydcOpDzGlFl2rj383dvScFNCtRB17Fm0
         efZmPJd+p3eBnSWZ02u29jQJCslWb+X77zvXrm6+vGY2Jm6grka3E9bVSCmzi9rrnk0W
         X01UoWzQjjC4FUVIxFc958Jlg2aokeumarLYN1l2Sd6LZHJgiIKdkCrTvvhfbNv9I+Gm
         rdb/y8RV9yHa/52KO4cR9TJ43YAeprQNEr2t2t4DcbSYvE8hj5aogiJL8XO6P2y2gi23
         MRTw==
X-Forwarded-Encrypted: i=1; AJvYcCVvhElzdFpXmIht28aonZ95avcZYdNIFhKsSiAhSlKxJsHiFKjxi8WTAzzarghU9OZwxf4DLNi6MeVd+Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkeDgWtTANlYek0XTnzZ2P/f/erCSwqIHVa3JyoGpbSMSLYzms
	7+A/KeAZtkFJ8vfoLnLwGpDZMk+Sj7+Z1YoedrLVFRqxsHjuPvmOa5K5cCFo5+lV+ij78tXBHCj
	zliZK4Hi7nh12hvERdCMQpNz8RlzGlbw=
X-Gm-Gg: ASbGnctJvxbc3FM9JNFkOtLDpYjpSQmKIidS4PMt/XsCYTStstsYJZIZ2N6102V6BWH
	8LAgkn1RmuhFGwSUbdmi/kN24F4S3e2VN5fPQeitwC/TXO/GnJ9aNJ88rUCgFG+Tkh3bdPsWtRS
	Wf8RR4fiRM9YI6MlltUBXLsRRIzitdvcBf2Yd0QU6h2R5u
X-Google-Smtp-Source: AGHT+IEGazgYcFFYqSWpOSkIHhn1MURd+j+lfv1uzCtxT/F1GutSwFjiAZmJjWp90mPosd+z0UJD6Cc/+Hr809fy1vY=
X-Received: by 2002:a05:6830:4189:b0:731:cac7:3634 with SMTP id
 46e09a7af769-734f6ac4e55mr12071806a34.3.1747758170553; Tue, 20 May 2025
 09:22:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
 <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
In-Reply-To: <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Tue, 20 May 2025 21:22:39 +0500
X-Gm-Features: AX0GCFuSeV0_iIfi2B7CrPBZxdbghCyFZ-5JMvI3TU0_KAOUPfiuj1Zu21ABgBM
Message-ID: <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
To: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
Cc: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Wu, Ray" <Ray.Wu@amd.com>, 
	"Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 8:06=E2=80=AFPM Pillai, Aurabindo
<Aurabindo.Pillai@amd.com> wrote:
>
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>
> Hi Mike,
>
> Could you more details about your setup, and how you were able to repro i=
t ?
>

Hi!

Did the probe not include enough information?
https://linux-hardware.org/?probe=3D4635c5fcb1

Anyway, here's the output from inxi:

> inxi -GSC -xx
System:
  Host: secondary-ws Kernel: 6.15.0-rc7-a5806cd506af-revert-f1c6be3999d2+
    arch: x86_64 bits: 64 compiler: gcc v: 15.1.1
  Desktop: GNOME v: 48.1 tk: GTK v: 3.24.49 wm: gnome-shell dm: GDM
    Distro: Fedora Linux 43 (Workstation Edition Prerelease)
CPU:
  Info: 16-core model: AMD Ryzen 9 7950X bits: 64 type: MT MCP arch: Zen 4
    rev: 2 cache: L1: 1024 KiB L2: 16 MiB L3: 64 MiB
  Speed (MHz): avg: 5355 min/max: 425/5883 boost: enabled cores: 1: 5355
    2: 5355 3: 5355 4: 5355 5: 5355 6: 5355 7: 5355 8: 5355 9: 5355 10: 535=
5
    11: 5355 12: 5355 13: 5355 14: 5355 15: 5355 16: 5355 17: 5355 18: 5355
    19: 5355 20: 5355 21: 5355 22: 5355 23: 5355 24: 5355 25: 5355 26: 5355
    27: 5355 28: 5355 29: 5355 30: 5355 31: 5355 32: 5355 bogomips: 287444
  Flags: avx avx2 ht lm nx pae sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3 svm
Graphics:
  Device-1: Advanced Micro Devices [AMD/ATI] Navi 21 [Radeon RX 6800/6800 X=
T
    / 6900 XT] driver: amdgpu v: kernel arch: RDNA-2 pcie: speed: 16 GT/s
    lanes: 16 ports: active: HDMI-A-1 empty: DP-1, DP-2, DP-3, Writeback-1
    bus-ID: 03:00.0 chip-ID: 1002:73bf
  Display: wayland server: X.org v: 1.21.1.16 with: Xwayland v: 24.1.6
    compositor: gnome-shell driver: X: loaded: amdgpu
    unloaded: fbdev,modesetting,radeon,vesa dri: radeonsi gpu: amdgpu
    display-ID: 0
  Monitor-1: HDMI-A-1 model: LG (GoldStar) TV SSCR2 res: 3840x2160 dpi: 61
    diag: 1836mm (72.3")
  API: OpenGL v: 4.6 vendor: amd mesa v: 25.2.0-devel glx-v: 1.4 es-v: 3.2
    direct-render: yes renderer: AMD Radeon RX 6900 XT (radeonsi navi21 LLV=
M
    20.1.3 DRM 3.63 6.15.0-rc7-a5806cd506af-revert-f1c6be3999d2+)
    device-ID: 1002:73bf display-ID: :0.0
  API: Vulkan v: 1.4.313 surfaces: N/A device: 0 type: discrete-gpu
    driver: mesa radv device-ID: 1002:73bf device: 1 type: cpu
    driver: mesa llvmpipe device-ID: 10005:0000
  API: EGL Message: EGL data requires eglinfo. Check --recommends.
  Info: Tools: api: glxinfo,vulkaninfo x11: xdriinfo, xdpyinfo, xprop,
    xrandr

I'm using an LG OLED42C3 TV as a monitor.

Let me know if you need any other details!


--
Best Regards,
Mike Gavrilov.
