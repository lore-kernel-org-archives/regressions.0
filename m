Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53115AF
	for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705887992; cv=none; b=Nei5gR3YESK7jil5t3PcZlydXFsVolBtDcn+oGrZn4Q6FXSKmiouvGvFuOy0N0THu5XzjgPqt8uielElHucVcZFQaMDiWA5iY4PMn6mOaJ4UB4xLY8Fgo43AR8njns0KzbhA5RU8muiy9dbsLXL3lNnYeh2rMrSZ5SNvoA7rEn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705887992; c=relaxed/simple;
	bh=mdOWFPQKK4Gv4Noq5npy1Ht8YfA9l6yE26DvapcDA80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEmwFwGHBqrOibqpurNW3HemPsbo6RmXYKcZdMMcekmYrVHCrG3NzJEPzm6A7s+WgzXJ2zjXEwazxy87FdVKWkIghz223K5VmFMhgsT+aRnFH6yQn79adlDezAvWJm8I9QZ6tXPglPzhmHSu8JgmWv94rc8s03ulzw/xqPgFw1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/hsZTrN; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/hsZTrN"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc223463ee4so2009536276.2
        for <regressions@lists.linux.dev>; Sun, 21 Jan 2024 17:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705887990; x=1706492790; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQfVtOz+HFJQtItzfaIVVASjhcqOtKuku6JlXDLa/IU=;
        b=H/hsZTrNcubgnXoih33KZTNZCc6l+liXizvhEhXmEk7TmN8HvAPQBudlGNvCY7ywwi
         OmHDZUEu63+Zop95f2vd7CBSsq47Ina8hF+ALfYbJcQwc42buodTyUT+XcgmtqMl9fPA
         PAsbz6viRntZMXMByHn8bHaryB0GskD8QCpZ0yvv16nK3b5Tnfb0cjmhvLc512prQqb2
         i5z1P6lr59pQxK9gH5XJqF+khC2wlOoZ+tm8IAgjxNqLLlebpdqVx78P12PGAmRgpSdS
         y4qAHCy494WYXIs9fSwyJ0bIlegungBv9cvSpdfeYeW1ksKtEVtDI9e/aDxxfFf27LAY
         zfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705887990; x=1706492790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GQfVtOz+HFJQtItzfaIVVASjhcqOtKuku6JlXDLa/IU=;
        b=NBmk88YCVcxOwogpnuhNPzGQ1ycuaYDA98zLCGD4LvkBO2s34LwJBZ34Onw9VPMopK
         E2+w/6pdJeV5colR8FoQ44thLdMfZHF4N9QibwScqOsi7/sGK5FiC1AM62Yb5NZGwpAt
         8++sqQfxmRUGmg29+mSzqfWbtFo9DKPnup7IbFDDzYBWVZ0+Yk8d5mvkl7hm0ow5F0I6
         VHXB/R6AxQL552oAwyJ6PNuezc4krlvpH168042VwlTzGw57UBlHy0YOJ3C3wgua0a9f
         4PBJngJQIPW/wt3C9LwaQzZo5aBgmNkTOgwstEDoDmP8TsG/9x1G3UySMLdRu2SWB7ur
         SIyA==
X-Gm-Message-State: AOJu0YwFcVdI6R1k86SDVFdE27tUmUAgD8WPyzVhG3+eYjugCx6Mpzv6
	rVKJgAeasfJhucuVbqVnnHZXGDGCd94HfHVpgFSda3bQtIeYeIjNdbLIaoMiWyGvh0DNwAhg0xL
	w7dBe0Y1oQ4OGja8aIQt5SZn4C84=
X-Google-Smtp-Source: AGHT+IFsJZJU1ElMcyjUj/RT6QzsPObVUM4KEdPf/ayE1ZmZ9eSMWBHPy0WhR4SoH2g45YWOAoa9l+1/ZPJJKO1W7Wg=
X-Received: by 2002:a25:aa01:0:b0:dbf:c7f:7062 with SMTP id
 s1-20020a25aa01000000b00dbf0c7f7062mr1550277ybi.35.1705887989952; Sun, 21 Jan
 2024 17:46:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKLYgeJ1tUuqLcsquwuFqjDXPSJpEiokrWK2gisPKDZLs8Y2TQ@mail.gmail.com>
 <39e3a4fe-d456-4de4-b481-51aabfa02b8d@leemhuis.info> <20240111155056.GG31555@twin.jikos.cz>
 <20240111170644.GK31555@twin.jikos.cz> <f45e5b7c-4354-87d3-c7f1-d8dd5f4d2abd@oracle.com>
 <CAKLYge+x9kxLBaJGyk_gTMK2kQ=+Lhg00jgXe=P=jmBUq=cmfA@mail.gmail.com> <7d28b18c-3477-83ec-ef89-cdaf6ca7ebee@oracle.com>
In-Reply-To: <7d28b18c-3477-83ec-ef89-cdaf6ca7ebee@oracle.com>
From: Alex Romosan <aromosan@gmail.com>
Date: Mon, 22 Jan 2024 02:46:18 +0100
Message-ID: <CAKLYgeKjkCJ2d0_5uDaH6C7wc4YpX9s6TnQVNDuSr8MsiYbujw@mail.gmail.com>
Subject: Re: [btrfs] commit bc27d6f0aa0e4de184b617aceeaf25818cc646de breaks update-grub
To: Anand Jain <anand.jain@oracle.com>
Cc: CHECK_1234543212345@protonmail.com, brauner@kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, 
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, dsterba@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 2:35=E2=80=AFAM Anand Jain <anand.jain@oracle.com> =
wrote:
>
>
>
> On 22/01/2024 08:07, Alex Romosan wrote:
> > update-grub still doesn't work 6.8-rc1
> >
> > so i did:
> >
> > # cat /proc/self/mountinfo | grep btrfs
> > 21 1 0:19 / / rw,relatime shared:1 - btrfs /dev/root
> > rw,ssd,discard=3Dasync,space_cache,subvolid=3D5,subvol=3D/
> >
>
> The latest Btrfs kernel expect one MAJ:MIN for a block device,
> but multiple nodes here point to the same root device:
>
>    /dev/root MAJ1:MIN1 \___ root-device
>    /dev/sda1 MAJ2:MIN2 /
>
> To fix, I'm exploring communication through block-device nodes
> with a temporary signature tag on the superblock for identification.
> Community feedback is pending, and potentially synchronization issues
> maybe a concer.
>
> > the difference from your test case is that it doesn't reference
> > the disk device but /dev/root which on my system doesn't exist. could t=
his
> > be the problem?
> >
>
> How are you reproducing this? I tried with Oracle Linux (OL), Fedora,
> and Arch Linux, but they didn't show /dev/root as the root device.

i'm running debian on a lenovo x1. this is my /etc/fstab

# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/nvme0n1p3 during installation
#UUID=3D695aa7ac-862a-4de3-ae59-c96f784600a0 /               btrfs
defaults        0       0
PARTUUID=3D43094f42-5f54-4456-9d14-3c41e92326e1 /               btrfs
defaults        0       0
# /boot/efi was on /dev/nvme0n1p1 during installation
#UUID=3DA4A3-9199  /boot/efi       vfat    umask=3D0077      0       1
PARTUUID=3D05e00aed-a6ad-4cdc-9a40-4b775dbf87a9  /boot/efi       vfat
umask=3D0077      0       1
# swap was on /dev/nvme0n1p2 during installation
#UUID=3D6b9a36ed-14d8-458d-8575-c8d29dc80bdf none            swap    sw
            0       0
PARTUUID=3Ddb40aeb2-88b4-46eb-970f-58a410bf272e none            swap
sw              0       0

i'm running my own compiled kernel without initrd. the disk with the btrfs
filesystem is the only disk on that laptop. i'm just booting the kernel
(everything works fine there) but when i try to run update-grub i get:

# update-grub
/usr/sbin/grub-probe: error: cannot find a device for / (is /dev mounted?).

--alex--
