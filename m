Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDBCEAE7
	for <regressions@lists.linux.dev>; Fri, 31 May 2024 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717185822; cv=none; b=s5HHnJgzRrC3ENSaXw2jkQR/BTZpOsUJdEqpwmOnFRXXC5Wbd0DEcYsiur+QioaocVez1hjULtwD6HbUDfqpLk+ngR2aKXOts9pCa2cKQYAI7Wv0pR+/UD2rpJr6Vw3gMnhPXkG+6gVxwoHuKeuKUvaARqRrY0tUIr96JzvRmTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717185822; c=relaxed/simple;
	bh=Exus06tqr0/Kq8YEqgDuuIugLyOcKaxMKoL2Ct6QxgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S0dCr6RHde4lv+K+FAbHpXLBcoF+5mIxy/s9OsYRhhJj/uFVeuqFTSwDTf3YhAcwqKh1f5gLUT0EK6aezkwFg6GBQ40tyNkV7+Nc8kK/derblkDF6nP3JEt+Z3WJEVdaTXnG3Fql39liuiIBZQvoulzCCL3qE67P/pwJGLBiPjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PtuT4Sdt; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PtuT4Sdt"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-24c9f2b7b19so1280635fac.0
        for <regressions@lists.linux.dev>; Fri, 31 May 2024 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717185820; x=1717790620; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSNcqX4IVvMIFvAxJ9VFtgkrXNlZP1MdCzc75UTTvr4=;
        b=PtuT4SdtFK/BRYurng+VlmBDqkEdRqQ68OmGN7Z6nnYfdZqdup6V5vw1esOF2Q8eLB
         tPF/ZT1+wp8uyqZx3dMXSdJALWqkuQ+sbSUU5bshGYwAg6d4EilKkIYvxsehKXIdsi6R
         gQkcolsHmWpVswY9jPvW4mxNwD6gqiHqnBckFNDFmYnS/BFUFCgD89NF99i8O7hK+5Th
         pHM69zHw9UUSulA+/NyU5qkxtrK6v1PXjAAn0D99OjxBEb7WyzZo9Qa7xuIz1fbeZnOz
         rWnoHOI423er71YjO6wyPAtSAYvQ9+oWhMowd1+oGyAL7WTkBUsPlsi5RWBz1H4t3+KF
         r7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717185820; x=1717790620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSNcqX4IVvMIFvAxJ9VFtgkrXNlZP1MdCzc75UTTvr4=;
        b=FbCcEhC2YJTwtBXBfegp/LR7f7mFHJW+i8ocqQi0svUqPNAUilc8NLkp+W3/iahIKQ
         8MpSaO6yQHPHKvPc8UfrnPdaa3IP0LMqPh0SFnfJ76llys7roBbDtbgLaUiZGJg7LzIF
         nFgqocNfd9vUmojLFIk6aY7nde+psOJHrogjB33K9fe8NXIkqo6Ga2JoXLFPZ9Bv62JW
         yR2FRXYhpNG7gr/jf6obW4Ri66z1DCbk1XDc2Ow00BOgWUos4Xue1BPuglTIsscn6Xs9
         oYt+IPlLS6R5zvWWuEkuLl/gPG17AwAk0zZYKaK+Kv2Hgia9uJWgG+j02C55A6edC0Mc
         aa1A==
X-Forwarded-Encrypted: i=1; AJvYcCXnWke87Rkh58+tU3DZyeERc4GBhz4Akoq2dN3jYvVbcZI49faptlZzF8cqYkTPZV73dfNkzbe7PXz0t1PGzVQlvHKLkSWcw35qr+4=
X-Gm-Message-State: AOJu0YyBWn6g5RFRik+FrcwJZHsJUnTsnqcOarx3eVP6PRqmVo7TMC4S
	DedxJgAXoUTJhGMDmy3svEGqsefPpwFy5nr/VV+XtyeA3LjxSkPH4roieFc7iNdUxZud2Pf5PrQ
	dSAfW+EgsEsyVONBx7ioBoOcXOrE=
X-Google-Smtp-Source: AGHT+IF+jb3kCuJMgporFnQo8vsVJEdyY8bSLcDZ8hFCE0qfR8UmsbtBNiJyGrQVoa0NlxiNwAyy6Y3Z1FRRY0UZCRQ=
X-Received: by 2002:a05:6870:d6a9:b0:250:191e:aeb2 with SMTP id
 586e51a60fabf-2508c04a931mr2873792fac.56.1717185820157; Fri, 31 May 2024
 13:03:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACLx9VdpUanftfPo2jVAqXdcWe8Y43MsDeZmMPooTzVaVJAh2w@mail.gmail.com>
 <493e6372-cb4d-4f1f-9803-17d37a0fcbc4@acm.org> <CACLx9VdOeY6ZXEwGp-FOQY5VKJzgN6jJZQMhOdY9WnQjm07KSA@mail.gmail.com>
 <effa6f38-50a0-4760-bcf6-71bdfac24ea6@acm.org>
In-Reply-To: <effa6f38-50a0-4760-bcf6-71bdfac24ea6@acm.org>
From: Joao Machado <jocrismachado@gmail.com>
Date: Fri, 31 May 2024 21:03:28 +0100
Message-ID: <CACLx9Vcv8o28n3_jmuJmP0gRb6zU+L_Ut0cP3KEy9b+p-t9bkQ@mail.gmail.com>
Subject: Re: [REGRESSION] USB flash drive unusable with constant resets, since
 commit 4f53138fff
To: Bart Van Assche <bvanassche@acm.org>
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch works when applied over commit 4f53138fff ! (bflags change and
it avoids the issue)

----working on patched 4f53138fff----
May 31 17:15:58 oldell kernel: usb 1-1.3: new high-speed USB device
number 5 using ehci-pci
May 31 17:15:58 oldell kernel: usb 1-1.3: New USB device found,
idVendor=3D0951, idProduct=3D1624, bcdDevice=3D 1.00
May 31 17:15:58 oldell kernel: usb 1-1.3: New USB device strings:
Mfr=3D1, Product=3D2, SerialNumber=3D3
May 31 17:15:58 oldell kernel: usb 1-1.3: Product: DataTraveler G2
May 31 17:15:58 oldell kernel: usb 1-1.3: Manufacturer: Kingston
May 31 17:15:58 oldell kernel: usb 1-1.3: SerialNumber: 0014780F9955F971A5E=
C08D7
May 31 17:15:58 oldell kernel: usb-storage 1-1.3:1.0: USB Mass Storage
device detected
May 31 17:15:58 oldell kernel: scsi host6: usb-storage 1-1.3:1.0
May 31 17:15:58 oldell kernel: usbcore: registered new interface
driver usb-storage
May 31 17:15:58 oldell kernel: usbcore: registered new interface driver uas
May 31 17:15:59 oldell kernel: scsi 6:0:0:0: bflags =3D 0x400000000
May 31 17:15:59 oldell kernel: scsi 6:0:0:0: Direct-Access
Kingston DataTraveler G2  1.00 PQ: 0 ANSI: 2
May 31 17:15:59 oldell kernel: sd 6:0:0:0: [sdb] 15654848 512-byte
logical blocks: (8.02 GB/7.46 GiB)
May 31 17:15:59 oldell kernel: sd 6:0:0:0: [sdb] Write Protect is off
May 31 17:15:59 oldell kernel: sd 6:0:0:0: [sdb] Mode Sense: 16 24 09 51
May 31 17:15:59 oldell kernel: sd 6:0:0:0: [sdb] Incomplete mode parameter =
data
May 31 17:15:59 oldell kernel: sd 6:0:0:0: [sdb] Assuming drive cache:
write through
May 31 17:15:59 oldell kernel:  sdb: sdb1 sdb2
May 31 17:15:59 oldell kernel: sd 6:0:0:0: [sdb] Attached SCSI removable di=
sk
May 31 17:17:34 oldell kernel: wlp2s0: deauthenticating from
f0:f2:49:98:2c:b8 by local choice (Reason: 3=3DDEAUTH_LEAVING)
------

Maybe code changes on recent commits are interfering with the patch.
Same behavioral differences are replicated on QEMU using USB pass
through for this device: tested both 4f53138fff patched (OK) &
1613e604df0 patched (Not OK).

Thanks Bart.


On Thu, May 30, 2024 at 5:38=E2=80=AFPM Bart Van Assche <bvanassche@acm.org=
> wrote:
>
> On 5/30/24 02:46, Joao Machado wrote:
> > Tried the patch over commit 1613e604df0. Issue persists.
> > Attached git and journal logs - notice here usb is using xhci_hcd
> > instead of ehci-pci, but this is because it's a different
> > computer/environment than the one originally reported.
>
> Thank you for having shared the systemd journal. In that journal I found
> the following:
>
> May 30 10:23:56 archlinux kernel: scsi 6:0:0:0: bflags =3D 0x0
> May 30 10:23:56 archlinux kernel: scsi 6:0:0:0: Direct-Access
> Kingston DataTraveler G2  1.00 PQ: 0 ANSI: 2
>
> This is unexpected. It seems like the new entry in
> scsi_static_device_list is being ignored?
>
> +       {"Kingston", "DataTraveler G2", NULL, BLIST_SKIP_IO_HINTS},
>
> Thanks,
>
> Bart.
