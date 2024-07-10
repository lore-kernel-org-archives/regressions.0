Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B541D8BEC
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 07:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720594874; cv=none; b=ij4TMCiFBgHvGvo/LRpkJeM/PiCS3np7l2p86ELn/k0lUUO+nuk7aB1eEuqrmIJno8HMiRE0z0fjIx7HnWoYFavXWRrhcNeXDrRxtXhJzJwwUa5X1/K3qOYaQD041e5UMQOSX0uC6qKSNWTJcy0p/Sfb0OVYredWmZXCDHvnkks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720594874; c=relaxed/simple;
	bh=0g/tbN5BOdpCUSIAXDAOLNWIFD9iOc+XZRuFSDfjuIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NXGyoyvoGvYWIL11jvcmlMvwx+buny+PPX49NwC9NfXD0/el04V2q9+O13bvWr9V+ob4YZt8gBJ15ZtcYyJ3zOuC84bPaPqIoiA8x8Sg2p/aWN3YpHhqgDgcCOYaF4eMo70OcaaNSWIr0XgK5r0tCR/fVFU0D3h8SfJ321AJgEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhycYVGf; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhycYVGf"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5c680f40faeso62637eaf.1
        for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 00:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720594872; x=1721199672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0g/tbN5BOdpCUSIAXDAOLNWIFD9iOc+XZRuFSDfjuIw=;
        b=NhycYVGf3nPkQLj92JIislMY7Kb36+L6tjxYOzbYOX1MVA3u6jjphArOCvBigidgE/
         uRjj5O6ZHRpqvwMtGh1Zd1rEcIrm5pj45QiQV3c1lLaRUb93M8CgIjSK0Rfj3WVn4WCZ
         YJgfCmdG87daJaCdmLtY6mtj2I8eHX2pePORcwjKp5OH8TrJYW1tnyXCm5gPxAvLfnnb
         7T7kYEcfqi9ZDcMNZCXuOxFCmhp0/xkeJKFMZEkkxQBs3t3sZy1Wd9+OpSXbpU4e6kG7
         zkQWvc26IqCESLN2juQQ4aOW9hCs/vUbBJqZg+hkbh96BMidqSKIEk/miMfHbMLu4rKU
         F1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720594872; x=1721199672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0g/tbN5BOdpCUSIAXDAOLNWIFD9iOc+XZRuFSDfjuIw=;
        b=pScfEfLYCRrv45SSh01vGd548mO2j018wMOLYxCgjh920+GuXqlfjnl5d/O8ZvAEwm
         k4UlyPLqlIBNb9xnJO5OH99RhT+T/eiembkZMKd73faCTuqGIqB7soW9z+sqvcz0VFt/
         3ZI3Dh5kY7w1oeQVOPpV1eVqv3O399z+R8TsQTTTc6fYYtuEj/t65kH/OMxtvyqBrDvK
         Ea/x5Bk9FuLB8OtpR8g7ZvxROUXwQjkbLSNNNtsfY5LNlrgQndLQdXoTOAzuYOWLm94z
         25Env6JpdheYv/fgyWlN/GjJvUukaBxKKvAPVIvdJv90vyoHAnSlQbHsPZ4q8X4LTrWQ
         2+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWFj/9a2D2l3tN9KV2gVjiyyPWT8EDJfNS6t/nZ27ezn9S2zLA1EPMg6idWHdWQ0yyN35Z5ieUtqQIbPoVpCoZRDIBhCSjOzAEa/I=
X-Gm-Message-State: AOJu0Yxhsi/JdoYfccilh0RwGcKpz6SYkhQErLItOay2myVkTaaAi7Uk
	qAzldudUetfDLzAfy63Nu1cTQvoUkgyuYuWh1uVMb4LiXVCFgjvol7bK9hAgu+hDoyNiM39COyT
	i625ZnFMZQT6UWzfG3wc8qetvDVQ=
X-Google-Smtp-Source: AGHT+IFx2BRvjtFXqoSg1+PvMMQRdSDlmRVGe6OqPGstIMZOnCPopgGEXsf8wsKHq0X3hpEtGSjUw3Isc0L2F8oBYBc=
X-Received: by 2002:a05:6820:2c05:b0:5c7:b587:40a7 with SMTP id
 006d021491bc7-5c7b58743aemr806363eaf.1.1720594871696; Wed, 10 Jul 2024
 00:01:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsNptxsQO=5=qi-JYiFX=rX8Ok5inK80Gn0qrUFWbtBGng@mail.gmail.com>
 <CADnq5_PDxJ8O1JUQ9RBYRFB9G1WZJos05ZAM4jUKuPBwPxjNkA@mail.gmail.com>
 <CABXGCsNN9LwHc2x2AAEH=5UNwpvkWkBqRYz3OP8MZ6Woy+HDXA@mail.gmail.com>
 <b6c440ca-e63e-429b-af41-5f27d4b8b2a2@leemhuis.info> <CABXGCsNoFfMn7LaqqFgEPg-ECyUPN=f=SXVrFi=GZk6c69-Gqw@mail.gmail.com>
 <CADnq5_PDSkr4hOHJmb1J30UC0a7sXsm5-TPkEmjzffMK_A+7ug@mail.gmail.com>
 <ea465a40-f673-42b1-8b1c-a2efb20cd562@amd.com> <CABXGCsPyrUEqDq2gbr4VLw5ncd9cKoCZ9nOr2SRfg8Lh=9H5Kg@mail.gmail.com>
 <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
In-Reply-To: <2915a8c4-ebac-4dae-8f09-32a5b4d9aeda@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 10 Jul 2024 12:01:00 +0500
Message-ID: <CABXGCsPuRViSd_WeOciLKcQ4hjYxJ7e3i7LomwsUMzd0a+zvBw@mail.gmail.com>
Subject: Re: 6.10/bisected/regression - commits bc87d666c05 and 6d4279cb99ac
 cause appearing green flashing bar on top of screen on Radeon 6900XT and 120Hz
To: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, 
	"Deucher, Alexander" <alexander.deucher@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 9, 2024 at 7:48=E2=80=AFPM Rodrigo Siqueira Jordao
<Rodrigo.Siqueira@amd.com> wrote:
> Hi,
>
> I also tried it with 6900XT. I got the same results on my side.

This is weird.

> Anyway, I could not reproduce the issue with the below components. I may
> be missing something that will trigger this bug; in this sense, could
> you describe the following:
> - The display resolution and refresh rate.

3840x2160 and 120Hz
At 60Hz issue not reproduced.

> - Are you able to reproduce this issue with DP and HDMI?

My TV, an OLED LG C3, has only an HDMI 2.1 port.

> - Could you provide the firmware information: sudo cat
> /sys/kernel/debug/dri/0/amdgpu_firmware_info

> sudo cat /sys/kernel/debug/dri/0/amdgpu_firmware_info
[sudo] password for mikhail:
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 38, firmware version: 0x0000000e
PFP feature version: 38, firmware version: 0x0000000e
CE feature version: 38, firmware version: 0x00000003
RLC feature version: 1, firmware version: 0x0000001f
RLC SRLC feature version: 1, firmware version: 0x00000001
RLC SRLG feature version: 1, firmware version: 0x00000001
RLC SRLS feature version: 1, firmware version: 0x00000001
RLCP feature version: 0, firmware version: 0x00000000
RLCV feature version: 0, firmware version: 0x00000000
MEC feature version: 38, firmware version: 0x00000015
MEC2 feature version: 38, firmware version: 0x00000015
IMU feature version: 0, firmware version: 0x00000000
SOS feature version: 0, firmware version: 0x00000000
ASD feature version: 553648344, firmware version: 0x210000d8
TA XGMI feature version: 0x00000000, firmware version: 0x00000000
TA RAS feature version: 0x00000000, firmware version: 0x00000000
TA HDCP feature version: 0x00000000, firmware version: 0x1700003f
TA DTM feature version: 0x00000000, firmware version: 0x12000016
TA RAP feature version: 0x00000000, firmware version: 0x00000000
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x00544fdf (84.79.223=
)
SDMA0 feature version: 52, firmware version: 0x00000009
VCN feature version: 0, firmware version: 0x0311f002
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x05000f00
TOC feature version: 0, firmware version: 0x00000007
MES_KIQ feature version: 0, firmware version: 0x00000000
MES feature version: 0, firmware version: 0x00000000
VPE feature version: 0, firmware version: 0x00000000
VBIOS version: 102-RAPHAEL-008

> Also, could you conduct the below tests and report the results:
>
> - Test 1: Just revert the fallback patch (drm/amd/display: Add fallback
> configuration for set DRR in DCN10) and see if it solves the issue.

It's not enough.
I checked revert commit bc87d666c05 on top of 34afb82a3c67.

> - Test 2: Try the latest amd-staging-drm-next
> (https://gitlab.freedesktop.org/agd5f/linux) and see if the issue is gone=
.

I checked commit 7cef45b1347a in the amd-staging-drm-next branch. Same here=
.

> - Test 3: In the kernel that you see the issue, could you install the
> latest firmware and see if it fix the issue? Check:
> https://gitlab.freedesktop.org/drm/firmware P.S.: Don't forget to update
> the initramfs or something similar in your system.

Is this any sense? Fedora Rawhide always ships with the latest kernel
and firmware.

--=20
Best Regards,
Mike Gavrilov.
