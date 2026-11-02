Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793633727;
	b=W/8/aOvSyFRc1pMNbI7Fs/K+eKJcPNVzmlwM/wzho/m6gC7oHKiPNSeBRL5u7+iHI1vQ
	 80XOLacP+jEHZBkscnPkKOXeRKf6SxzNiOMwbFUQgpeuNopacT73738ic40os3JcQcepl
	 ttbcL5ZH15+5fNjglbmUaIhZpWwBGD6sMK1i1/8z3YYLr2HGkvZO7rJ49OzxYbCUmhMP5
	 f6p1yD02/zTaU61ukvoajR6/DeT3m2r7PaEDDYH1sY7bSGCifK7bUDgjcjDLccYVpM9q5
	 OwGcTJ4i1iwCcBoHd5PNQ2UtWjXHopx9Oagn/KpE2cAg/JYtIh6jss7VvjjDmMg8szQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1VmlI/ur8pujk541VodzhFgp6hX5xM0UtNlOZvLTJKg=;
	b=ZVrmRbpPy/H+A+EombKupIJXpUfXk7bN5fJhz+jIHPJaEoezLH2S3m4p+gptl/9VHZ5E
	 OE9tJtdWvsBlTMFI0F9R6VbFUwvec5fit/MuKH1Lidw2scg+v0ZXscyyGnTHSsOCfAYrR
	 /b53z/Kc+Oiw+GnJiyHAtcNEep8+EzfiLgdMaDtB8AS1eu4fGdVILkbUaqhEDwZUxg6Wg
	 CntTo7m7CMdCgUbeSpcKrmEfWuykKmBKt8AZ5UoNSZzNdIcvV9PRpasIPstsgZr+BWMg4
	 6k3cUXBZYsg4WV7Au4rmKFCz6HvCeVIWrXIquwrYaHgHRawfuI149NORj+emKUSCXBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifDp3eyK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EEB60A1880
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 15:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EEB60A1880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ifDp3eyK
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df160bb9cso401473f8f.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 07:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793633726; cv=none;
        d=google.com; s=arc-20260327;
        b=e5HF1LPltnSpjF8iXF3/8KQwL1ifykygrqbYfLXVSCDPn+xhPNfy7dsmb2QHaPXdGk
         kl3AtMgC3gKopFc3H+RZIe+9Y+IIJgxF5gOQg/7WLl+A250N13C72DKxKG71qh4sjrgl
         50FRpAIgc5SMCsLJuo8/1py45zk5Qx2QGDdV0Jtv8Qcn+4/FOK2FwaZSAe3+j5dY97CX
         /lWje8+d2M7InxNN0MOjqLs7KhfG5N0O/emKcmx8gIEgCuDZhkTmetsm2ggCcsj74FrQ
         koiuEOxG0/kkjYmuZTmCrdEwcvsle1YzH6fUeCWBFJUcf06brB3G6x1uHu7MUBc+H4bG
         Ln1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1VmlI/ur8pujk541VodzhFgp6hX5xM0UtNlOZvLTJKg=;
        fh=l4JN80WEJFV3qoF1PWtWY5XS7cF8xQga8vk9hk2HPXs=;
        b=q6veYAbBb7uIicgg8WZtj48nrLAiEJXdC6+edZiz8uGaInrH1dkyooR7OS+l7396Ec
         US84rNE0ZJtO9F60UMi6hMtg+nsZ5cNNrj51SshbJ1jUncqEQbi3/DZbWirFPhG5vqjo
         H+YzZlMflbfTekFvRXKGFj/VCTn4Bg6u4SWW1/8FY7biVeIceILyW67s4J1cyaXpOVjS
         WGpU3KKhtNIZ+wSclpl3pLuJpdEwlZNorkPUavPsPSeuG0JhR8qpRHjg3it95RVdEF/i
         92/zYZ5a5ustP+i3QWNBHr2Iqq2LK6Sp5aJOt2HpgJYbjqchTH1wzvBNxUfRF9vCGrTC
         dGGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793633726; x=1794238526; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1VmlI/ur8pujk541VodzhFgp6hX5xM0UtNlOZvLTJKg=;
        b=ifDp3eyKn64z/ngRv8iCqN8wHmyakELD9bBRtdKImCSrA7Yhit/s67y9Or6SZNCBoR
         rgKgYBuICyQUMC+dB318UbmAUvPNPSmbkwX1KDbTqcwbToPf8DWKvNhFch4rbNcIPg31
         JuP1ZuutzYAPk9QJ90nJ8e9UxFaPL9YQk1yMQuzK5DygBZY8/t+qNZxpsPuDZB9YkZm+
         W7YbxvA34aGPJrU16dj49PpPCrOCKyKOQxyVU2NOdxyx6YxzLqaOMVg5z3B0BrsE9mx+
         YPPAF+OyAXP5vu7JxxEjkewlpvlXvAKovit8Ww55nYHa0MVvmaNrfbAim8NaavTt9moI
         PGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633726; x=1794238526;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1VmlI/ur8pujk541VodzhFgp6hX5xM0UtNlOZvLTJKg=;
        b=UAd47UP9jBR1D0MPIbaqJsg8vCkpgNXTFkR2gWJuJ3nm+lviAa1dzqoiOavX+XKxae
         uSViomN0cp6YZgTi43E0XUukTHDfgCVZO6peyfEu82V1ITCDmGRmg9LOShV8Bbw0Ezwk
         q4heCjq/qKaq807JNnlAgqXSKEHq3+fXKY5R8iMVmB9AyAEuky9x5SV3zDccl8M/Ve5r
         kXFXOXz41JLuKcqKV3LWgoIAxolXtVMcTU2c/71JPFmOJdu1wAZpgWOv7tk4HAT0pzj2
         QwS30TSvMAjd9NmQN//uVxpb49aTQvxRJFuePk2WhYU7MTVqM4gHWc//lG8yEMdInEsi
         bJkA==
X-Forwarded-Encrypted: i=1; AKwUvBzZ4AUar6kHB3jesjkkRC4PcWWl0dhvCCjaQz7C3yrth/IFzlHGlx8A0AsHYmZRf3es5jXbEFvbFEBKlw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9FoUvi+iBBitHq8YiEnpMpNAFnBQS7mnQmgAT/4t5oljMxcZWz
	E/cruDexG3f0eQA2zNyAhvePH7Ud70rpsgkIAjFTiD8EA94PIi4J4dqexbiUJme//0yxc0q+N9g
	20ehgJd1f5yHWGMjpWqeH+jFZszD/e/0=
X-Gm-Gg: AYBFou1eCo7y0uwb6DPCgtiGh7+fCno8of8QZgWQT3xFp9uSPEpZ9FFycluW8NjNgi8
	0QfBJLYBlN4JDbWHm2DUByO3Vz3mS8xxxCnsvZHooolmo6azh67KUKkqxY8RbmEaI9QXZj1dLR1
	ZoGV1ikb/ejOHOwWY0bbpY+0YZ7yA+0J7z2ZXwVBEcXj4ZMqLw3k65ABf5GxuIq9Eox8lGdk976
	BV8SkZCy9KdRatR4pAP8j0JL5obOaWiVYlRk+L/rY4glBxJvlJOebcWvJ+2eVQpZGn7n8Yar4uF
	P2/FAvDUoeLGk6Q3U59KyKm+nroQsOsV1ZrKTbF4dHAJvVjCUG5HSaJCPFbZsy+LlvCApaALLuF
	5kr8lrsR5VQ1sst4OOROm7fmIFrgxOG3NqfoTPbjarBnMWUQHPRV7stKG3tv9aRzGyTou1gGxMD
	eMi6H4ujlKRMoHkp8=
X-Received: by 2002:a5d:5d84:0:b0:48d:f4e6:7b2 with SMTP id
 ffacd0b85a97d-48e6e2ef836mr26445121f8f.3.1793633725752; Mon, 02 Nov 2026
 07:35:25 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
 <CADnq5_MzmNYq0WA5HFaOp6E3WO82YqTT5opCgkAbvv=9Q8AQnw@mail.gmail.com>
In-Reply-To: <CADnq5_MzmNYq0WA5HFaOp6E3WO82YqTT5opCgkAbvv=9Q8AQnw@mail.gmail.com>
From: Nathan Blomquist <nblomquist@gmail.com>
Date: Mon, 2 Nov 2026 10:35:15 -0500
X-Gm-Features: AclHuK962Noi3LW7yElw2uoZtZQY-4IYY24WlF4N7jEb4zcw_35WPIcdhBVu4mU
Message-ID: <CACOV87Wp8a8v_tn_UDD8mF6mo-ToSUMPefRT=RVbC-uQuZyqoQ@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: Navi 23 passthrough fails after ef5fcf2a6c32
To: alexdeucher@gmail.com, lgs201920130244@gmail.com, 
	Mario.Limonciello@amd.com
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev, 
	alexander.deucher@amd.com, christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alex,

On Mon, Nov 2, 2026, Alex Deucher wrote:
> Can you attach your kernel logs to the bug report?

I've added the dmesg logs to the freedesktop report:

https://gitlab.freedesktop.org/drm/amd/-/work_items/6076

Thanks,
Nathan



On Mon, 2 Nov 2026 09:09:44 -0500, Alex Deucher <alexdeucher@gmail.com> wro=
te:
> On Mon, Nov 2, 2026 at 3:16=E2=80=AFAM Nathan Blomquist <nblomquist@gmail=
.com> wrote:
> >
> > Hi,
> >
> > I can reproduce a Navi 23 / RX 6600 (1002:73ff) passthrough failure on
> > unmodified upstream Linux 7.2.10. It happens during the amdgpu-to-VFIO
> > handoff, before any guest code runs.
> >
> > Revert/add-back tests on Proxmox kernels isolate ef5fcf2a6c32
> > ("drm/amdgpu: fix autosuspend cleanup during removal") as the trigger.
> > Removing its added call from -20 works; adding it to working -19 fails.
> >
> > Tracing shows amdgpu_device_baco_exit() returning -ENOTSUPP (-524)
> > during runtime resume: the live BACO feature reports supported but
> > not enabled. The exit sequence is skipped, and a later bus reset
> > leaves both graphics and audio inaccessible.
>
> Adding a few people. I'm not quite sure I follow what's happening.
> Can you attach your kernel logs to the bug report?
>
> Thanks,
>
> Alex
>
> >
> > The candidate below keeps the autosuspend cleanup and allows the exit
> > based on the selected runtime mode. In two clean baseline/candidate
> > build pairs on upstream 7.2.10, the baseline fails and the candidate
> > restores reset recovery and guest graphics/audio initialization.
> > Sustained rendering and repeated-reset stability are not yet tested.
> >
> > Is the selected runtime mode the right condition to use here?
> >
> > Full report:
> > https://gitlab.freedesktop.org/drm/amd/-/work_items/6076
> >
> > #regzbot introduced: ef5fcf2a6c320676bf8be2dadac93d9023b468b7
> >
> > Candidate patch:
> >
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -6412,8 +6412,16 @@
> > {
> > struct amdgpu_ras *ras =3D amdgpu_ras_get_context(adev);
> > int ret =3D 0;
> > -
> > - if (!amdgpu_device_supports_baco(adev))
> > + bool runtime_baco =3D adev->in_runpm &&
> > + (adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_BACO ||
> > + adev->pm.rpm_mode =3D=3D AMDGPU_RUNPM_BAMACO);
> > +
> > + /*
> > + * Runtime PM selected BACO while the device was active. Firmware can
> > + * clear the live feature bit during D3, but the matching exit sequenc=
e
> > + * must still run to restore the runtime D3 policy.
> > + */
> > + if (!runtime_baco && !amdgpu_device_supports_baco(adev))
> > return -ENOTSUPP;
> >
> > ret =3D amdgpu_dpm_baco_exit(adev);
> >
> > Thanks,
> > Nathan
