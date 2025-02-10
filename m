Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B191525A35F
	for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739230111; cv=none; b=R5Gio4nIIGvL6ooaKbF5Jo3BlKUYn10cw0mf66o7pssv636zY/qB5xb1eJR1X+aQ0oRwT4WOINGBAbCBay8m/tl5GdIsEQAbZKPNE7ldkBl6zvw7sZ91Ga4GduXQKMjRA5hMIcSYQ3f+jtbmuv1enQ8AmYR2iuzBhbC4PXcB7s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739230111; c=relaxed/simple;
	bh=Dk2g0mrP/WznGyYyml3JAjUWfgB6R/Sb93BOiU/Jx8E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkS+R8+d4Wal4zQECmWAGZy4GNlOa0EGHUvjrxH522+1th+Do3038MWozR8dbYHN+curJi3RsHoB14GZq7+XrSMPMz4oVotvInrw7mF3Y1HIpWllicFA611YIA+8LaFsoofIqMeO4fW93tqOZgOiw55gco9fWEaSKdNgehWiOzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFymOkFm; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFymOkFm"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa200c3d16so1030061a91.2
        for <regressions@lists.linux.dev>; Mon, 10 Feb 2025 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739230109; x=1739834909; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y04FWno7eVdm+XTep4SFCbwINXdlE+Hewfwb1Q4vDsY=;
        b=kFymOkFmXND8TaB2AF5saPTMpgPVUzKTNd3eW35i0Nb2QnVDLBJt5Bzsdmd47L+0fS
         UxnhE+r6Zf16BU40R89/blCdlZ7kpTz2roDH7ZU1Z456AFRib+ELwvvIXFiEeK59l7tT
         7pbsxaN5CfCRe18Oqsk2br4lRgK/grKWef/ra/NhYZ46yyRE81c37ddiLtk4z8DL7/rl
         mBKwmO24MBsloTwNrKRGO2l+kZSu04iXnVxOp1f35AR5kA8vB6M7M9N+BuXEXYoPB1SF
         FopZHg3F7qYhMYJ1y3WOddFG09uPEBgCRqwhCmVzeRInKTMKlc03lPmVV9ARm7jSIszU
         VuLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739230109; x=1739834909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y04FWno7eVdm+XTep4SFCbwINXdlE+Hewfwb1Q4vDsY=;
        b=m8YndoJ4bjxV3n8wrpXM7IS3nCAZ5vdj5FzLDZnljBUQ+a2AEXMK9AXKahr/1Yn0qM
         kppNP7ZCRDca2DGbDP4VhAyfq5Sp8jlpRewhN2aGjDZKTtGDMAfOAyFgy9yWMzgl3cv9
         GPcceG/mQnvu9UyOIPo32rh3Lwvm9vltqgN8GZfHmzusuMUdNIEqx8mbe4TDrTwuDgpd
         jlOVxbtn21/+vGYfYb7rEc4KTEthqHIsjozurhGA2YX5e4Ciimb6ViHmWiw+3N8+G2Xt
         rld2wbe2uCN4vT/kO2SSWrNLzkjS7WX2S7umGRILddiNQ7SeN0HKzH2tRsndZ9IRE1dp
         bGjg==
X-Forwarded-Encrypted: i=1; AJvYcCXQNMFxPo9+fBHUp6ezp1cWZ8ifv5EjFiRhJYDo8XuWWvRFi8ED3mArPjyChd/+kpQ4HHZJanSTRwOyiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM2eeoYRQKes20FLAiC51Yz2s+Tex3BDpoIp8oy2kn/kiyegPZ
	8VzntvgSpO5jhmL2Cn9k13GryimIQFBsoBRPujmiKn01UBQm7PhifCZdFA1Qm1fxUGTVujJ598e
	mSVJ5c5yLOgvjIdfJXsZpd7ZYDk4=
X-Gm-Gg: ASbGncvssZ0krtJyS6IfkqdvcDeSudKqqGKWca+cFZPfKvE7/E01xRTW6U3Xm8O5cXc
	tzgqu8wTBET493fne7WqEBypwQD8oX8CMmkLtfKpujz8HEASZC51+JWJtUhya37wqzV54uXvz
X-Google-Smtp-Source: AGHT+IFctBavSJDgPKKmUcWmkTaB+G1FaFACJxbFNAbE9Zh1jvX4BIAtao4f648LL4Xej63qr4H4JfqvQ4t9ECdGLNI=
X-Received: by 2002:a17:90b:4a06:b0:2f2:f6e5:d28e with SMTP id
 98e67ed59e1d1-2faa4af590amr226094a91.3.1739230108827; Mon, 10 Feb 2025
 15:28:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250210191518.351576aa@foxbook>
In-Reply-To: <20250210191518.351576aa@foxbook>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 Feb 2025 18:28:16 -0500
X-Gm-Features: AWEUYZmkKZ2TZWorjLJThDYcf2TNAQ4zYOKhqXIsjVQqWx4D6g6h5CFmYu5meOU
Message-ID: <CADnq5_PaMfk65E2NRwPcsr-+bF6iKc8Le4mRkye9BZ=c4xQ-yQ@mail.gmail.com>
Subject: Re: [REGRESSION 6.14][BISECTED] AMD Carrizo shutdown hang since
 amdgpu commit ff69bba05f08
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev, 
	Kenneth Feng <kenneth.feng@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Boyuan Zhang <boyuan.zhang@amd.com>
Content-Type: multipart/mixed; boundary="000000000000d1e363062dd210be"

--000000000000d1e363062dd210be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2025 at 6:03=E2=80=AFPM Micha=C5=82 Pecio <michal.pecio@gma=
il.com> wrote:
>
> Hi,
>
> I have a machine with this APU:
> AMD PRO A10-8770 R7, 10 COMPUTE CORES 4C+6G
>
> 6.13 was OK, with 6.14-rc2 it hangs on shutdown after the display
> turns off.
>
> git-bisect says:
> # first bad commit: [ff69bba05f085cd6d4277c27ac7600160167b384] drm/amd/pm=
: add inst to dpm_set_powergating_by_smu
>
> The preceding commit does indeed shutdown normally.
> AMDGPU is built into the kernel image, not sure if it matters.
>
> Final lines of dynamic debug over serial pasted below. Any ideas?

Does the attached patch fix it?

Alex


>
> Thanks,
> Michal
>
> [   79.232113] [SURFACE]:Pipe 0: width, height, x, y
> [   79.232113] viewport:1600, 1200, 0, 0
> [   79.232113] recout:  1600, 1200, 0, 0
> [   79.251418] amdgpu: [IPS]: dc_allow_idle_optimizations_internal: allow=
_idle old=3D0 new=3D1 (caller=3Damdgpu_dm_crtc_vblank_control_worker)
> [   79.253727] [SCALER]:resource_build_scaling_params pipe 0:
> [   79.253727] Viewport: height:1200 width:1600 x:0 y:0  Recout: height:1=
200 width:1600 x:0 y:0  HACTIVE:1600 VACTIVE:1200
> [   79.253727] src_rect: height:1200 width:1600 x:0 y:0  dst_rect: height=
:1200 width:1600 x:0 y:0  clip_rect: height:1200 width:1600 x:0 y:0
> [   79.303043] [SCALER]:resource_build_scaling_params pipe 0:
> [   79.303043] Viewport: height:1200 width:1600 x:0 y:0  Recout: height:1=
200 width:1600 x:0 y:0  HACTIVE:1600 VACTIVE:1200
> [   79.303043] src_rect: height:1200 width:1600 x:0 y:0  dst_rect: height=
:1200 width:1600 x:0 y:0  clip_rect: height:1200 width:1600 x:0 y:0
> [   79.339233] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
> [   79.339691] [SCALER]:resource_build_scaling_params pipe 0:
> [   79.339691] Viewport: height:1200 width:1600 x:0 y:0  Recout: height:1=
200 width:1600 x:0 y:0  HACTIVE:1600 VACTIVE:1200
> [   79.339691] src_rect: height:1200 width:1600 x:0 y:0  dst_rect: height=
:1200 width:1600 x:0 y:0  clip_rect: height:1200 width:1600 x:0 y:0
> [   79.384264] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
> [   79.384601] [SURFACE]:Pipe:0 ffff888104900000: addr hi:0xff, addr low:=
0xed3000, src: 0, 0, 1600, 1200; dst: 0, 0, 1600, 1200;clip: 0, 0, 1600, 12=
00
> [   79.408652] [SURFACE]:Pipe 0: width, height, x, y
> [   79.408652] viewport:1600, 1200, 0, 0
> [   79.408652] recout:  1600, 1200, 0, 0
> [   79.428580] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
> [   79.428597] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: finish,
> [   79.428597] nbpMark_b: 0 nbpMark_a: 31870 urgentMark_b: 0 urgentMark_a=
: 16615
> [   79.428597] stutMark_b: 0 stutMark_a: 27915
> [   79.428597] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
> [   79.428597] stutMark_b: 0 stutMark_a: 0
> [   79.428597] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
> [   79.428597] stutMark_b: 0 stutMark_a: 0 stutter_mode_enable: 1
> [   79.428597] cstate: 1 pstate: 1 nbpstate: 1 sync: 0 dispclk: 0
> [   79.428597] sclk: 0 sclk_sleep: 12225 yclk: 2668000 blackout_recovery_=
time_us: 0
> [   79.429071] amdgpu: [IPS]: dc_allow_idle_optimizations_internal: allow=
_idle old=3D0 new=3D1 (caller=3Damdgpu_dm_crtc_vblank_control_worker)
> [   79.527445] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: start
> [   79.527463] [BANDWIDTH_CALCS]:dce110_validate_bandwidth: finish,
> [   79.527463] nbpMark_b: 0 nbpMark_a: 31870 urgentMark_b: 0 urgentMark_a=
: 16615
> [   79.527463] stutMark_b: 0 stutMark_a: 27915
> [   79.527463] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
> [   79.527463] stutMark_b: 0 stutMark_a: 0
> [   79.527463] nbpMark_b: 0 nbpMark_a: 0 urgentMark_b: 0 urgentMark_a: 0
> [   79.527463] stutMark_b: 0 stutMark_a: 0 stutter_mode_enable: 1
> [   79.527463] cstate: 1 pstate: 1 nbpstate: 1 sync: 0 dispclk: 0
> [   79.527463] sclk: 0 sclk_sleep: 12225 yclk: 2668000 blackout_recovery_=
time_us: 0
> [   79.609435] amdgpu: Setting Deep Sleep Clock: 1222
> [   79.616505] amdgpu: enable Low Memory PState.
> [   79.708792] amdgpu: Setting Deep Sleep Clock: 1222
> [   79.715842] amdgpu: enable Low Memory PState.
> [   79.722763] amdgpu 0000:00:01.0: amdgpu: IP block9 already in the targ=
et gate state!

--000000000000d1e363062dd210be
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-drm-amdgpu-pm-fix-UVD-handing-in-amdgpu_dpm_set_powe.patch"
Content-Disposition: attachment; 
	filename="0001-drm-amdgpu-pm-fix-UVD-handing-in-amdgpu_dpm_set_powe.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m6zoov2g0>
X-Attachment-Id: f_m6zoov2g0

RnJvbSA3MDIxMGM1YTc5YjQ4NDA5NjdiMjZjYjk3YWJiYzA5Yjg3ZDJhZTc1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5j
b20+CkRhdGU6IE1vbiwgMTAgRmViIDIwMjUgMTg6MTg6MjkgLTA1MDAKU3ViamVjdDogW1BBVENI
XSBkcm0vYW1kZ3B1L3BtOiBmaXggVVZEIGhhbmRpbmcgaW4KIGFtZGdwdV9kcG1fc2V0X3Bvd2Vy
Z2F0aW5nX2J5X3NtdSgpCgpVVkQgYW5kIFZDTiB3ZXJlIHNwbGl0IGludG8gc2VwYXJhdGUgZHBt
IGhlbHBlcnMgaW4gY29tbWl0CmZmNjliYmEwNWYwOCAoImRybS9hbWQvcG06IGFkZCBpbnN0IHRv
IGRwbV9zZXRfcG93ZXJnYXRpbmdfYnlfc211IikKYnV0IHRoZSBjaGVjayBhdCB0aGUgdG9wIHdh
cyBzdGlsbCBpbmNsdWRlZCBVVkQgZnJvbSBhbiBlYXJsaWVyCnZlcnNpb24gb2YgdGhlIHBhdGNo
LiAgRml4IHRoZSBjaGVjay4KCkZpeGVzOiBmZjY5YmJhMDVmMDggKCJkcm0vYW1kL3BtOiBhZGQg
aW5zdCB0byBkcG1fc2V0X3Bvd2VyZ2F0aW5nX2J5X3NtdSIpCkNsb3NlczogaHR0cHM6Ly9naXRs
YWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvLS9pc3N1ZXMvMzk1OQpMaW5rOiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9hbWQtZ2Z4LzIwMjUtRmVicnVhcnkvMTE5ODI3
Lmh0bWwKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPgpDYzogQm95dWFuIFpoYW5nIDxib3l1YW4uemhhbmdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vYW1kL3BtL2FtZGdwdV9kcG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vYW1kZ3B1X2RwbS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMK
aW5kZXggNmE5ZTI2OTA1ZWRmYy4uN2EyMmFlZjZlNTljMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9wbS9hbWRncHVfZHBtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9h
bWRncHVfZHBtLmMKQEAgLTc4LDcgKzc4LDcgQEAgaW50IGFtZGdwdV9kcG1fc2V0X3Bvd2VyZ2F0
aW5nX2J5X3NtdShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAlpbnQgcmV0ID0gMDsKIAlj
b25zdCBzdHJ1Y3QgYW1kX3BtX2Z1bmNzICpwcF9mdW5jcyA9IGFkZXYtPnBvd2VycGxheS5wcF9m
dW5jczsKIAllbnVtIGlwX3Bvd2VyX3N0YXRlIHB3cl9zdGF0ZSA9IGdhdGUgPyBQT1dFUl9TVEFU
RV9PRkYgOiBQT1dFUl9TVEFURV9PTjsKLQlib29sIGlzX3ZjbiA9IChibG9ja190eXBlID09IEFN
RF9JUF9CTE9DS19UWVBFX1VWRCB8fCBibG9ja190eXBlID09IEFNRF9JUF9CTE9DS19UWVBFX1ZD
Tik7CisJYm9vbCBpc192Y24gPSBibG9ja190eXBlID09IEFNRF9JUF9CTE9DS19UWVBFX1ZDTjsK
IAogCWlmIChhdG9taWNfcmVhZCgmYWRldi0+cG0ucHdyX3N0YXRlW2Jsb2NrX3R5cGVdKSA9PSBw
d3Jfc3RhdGUgJiYKIAkJCSghaXNfdmNuIHx8IGFkZXYtPnZjbi5udW1fdmNuX2luc3QgPT0gMSkp
IHsKLS0gCjIuNDguMQoK
--000000000000d1e363062dd210be--
