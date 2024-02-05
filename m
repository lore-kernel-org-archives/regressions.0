Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D08B1BC2C
	for <regressions@lists.linux.dev>; Mon,  5 Feb 2024 12:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707136716; cv=none; b=LDHEHiTERly32SW5kTffeoettxpUw26bLVTuySM8BlvqNb2DWkHnPIQM0Z8w1I3vYSu8AlGicbCsOO8MuJLEOno4UKwsvsZ2ihYXhWqMGUYHt6BFN+2xtiJ6hSZijcNsYfq8qX7yDY9P4LljkGatNgDLqmfGZndd0u550NoyA68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707136716; c=relaxed/simple;
	bh=ZjyQvDoFp8Iz2SVNGI6LFFX46oN/i7mz7hhxREWzs8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGm/G/F1mtqfRVlebnhnqfNklA1XJ3hjyfnQ2zxAk3D6Zpps+LClvyDc4UpmL9JbEa0jrbH2q87410mmNMR+Zw2oV7xypnvFLTsCEyxqJHJxVkZO6Rdk+ecrDrzHsST4Q23nEhZ+E9MkcDxGDJwVtR9UwfJx8sbvT9dkKlAEm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MpJ83tXZ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MpJ83tXZ"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6043efd46f8so10929597b3.0
        for <regressions@lists.linux.dev>; Mon, 05 Feb 2024 04:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707136714; x=1707741514; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjyQvDoFp8Iz2SVNGI6LFFX46oN/i7mz7hhxREWzs8w=;
        b=MpJ83tXZ4norEjL9GG8y+qu1gjDgN2CY2nSTsVsO23KArCPRfg3m6cQ5OHSdsuNxXn
         BCeWW+nOWpGW8EWfGX5NnEeFiwPEbgUzEa0tgUXzR815e07dYjo+Z5x/6pFjRMtFLZHB
         7QCXYji3jTGBeC4mOFZFm++uaTLnZxkuaKvn7fPOMYIeJZAQJ47lGjUK/ur1AcWLX2ln
         yBxNGUZ1HY4+iZEe8n4Ec8gSHMtIAt7ygpeADHT9nD3/FSVxHp23lt/XMdxnTf+yaRDb
         Rordc9RavmdBkJZB0Ey9VTy8OBjhPNKG2hEmttT8r6s63zC/7DP5eUEapY6TNElPCCCb
         LzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707136714; x=1707741514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjyQvDoFp8Iz2SVNGI6LFFX46oN/i7mz7hhxREWzs8w=;
        b=asFjV1pJRY+M/3Rq13wVvDGBKMt2RmXtCgZ44GOKGtDEbRvb0U5vVK6jUb6ac7e+9Y
         rKMX+BUsJDrAMJunrtNlmI8QlUF2r33o2oI0lvlCvaSCl/kvmzqZ7vLKUzJ5mHZuLvOY
         4gUCmSWIfWCAVAJZSYMVKzPb6+NThXqVI98LZc7oivF9Pzqni6yoEhnx+omNWTcx+o7t
         rso8XFYUQcvHe/SMpcLSo9U22NxWq2fVG7Cm6s/b2gmKmjyPYtNW3N+EuQiZe+BfRRuZ
         wyt9xM79HFdYf/EPgVpmZ9xKPqNePW86P6ONahGzd0rAGmmBQSyOqWNJMfgM5hvOF/Cr
         ScsQ==
X-Gm-Message-State: AOJu0YwDWIkDsryn5OgrTmn5Pw6x8VKy1PAM109EKA4p6EBhjF/McCZT
	WGmxq2K8WKQ21A9F132seBmke/xTG1ZbOeXYaMET319oYjZPV0mDsnFOd0ZYik93cz2/HopeTuU
	fZnlEVy5kebdzA9vTmtPWbkpPnYQ=
X-Google-Smtp-Source: AGHT+IED7kOb/CTGUQsjCMQwiFvHcr73C4qzzSvs1YNrN19FZXiTn8fx9WHoc17GvdpKwLrWsPYV7AoAmypKzVM+8/Q=
X-Received: by 2002:a25:145:0:b0:dc6:e75d:d828 with SMTP id
 66-20020a250145000000b00dc6e75dd828mr7804555ybb.18.1707136714056; Mon, 05 Feb
 2024 04:38:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKLYgeJ1tUuqLcsquwuFqjDXPSJpEiokrWK2gisPKDZLs8Y2TQ@mail.gmail.com>
 <39e3a4fe-d456-4de4-b481-51aabfa02b8d@leemhuis.info> <20240111155056.GG31555@twin.jikos.cz>
 <20240111170644.GK31555@twin.jikos.cz> <f45e5b7c-4354-87d3-c7f1-d8dd5f4d2abd@oracle.com>
 <7d3cee75-ee74-4348-947a-7e4bce5484b2@leemhuis.info> <CAKLYgeLhcE5+Td9eGKAi0xeXSsom381RxuJgKiQ0+oHDNS_DJA@mail.gmail.com>
 <CAKLYgeKCuDmnuGHuQYPdZZA1_H3s9_9oh+vT_FMpFZqxKSvjzw@mail.gmail.com> <20240205112619.GC355@twin.jikos.cz>
In-Reply-To: <20240205112619.GC355@twin.jikos.cz>
From: Alex Romosan <aromosan@gmail.com>
Date: Mon, 5 Feb 2024 13:38:23 +0100
Message-ID: <CAKLYgeK835ESfJ-rNzRsLHKUMQ8rU6HzV3_x6XaUu=HX0sg1=A@mail.gmail.com>
Subject: Re: [btrfs] commit bc27d6f0aa0e4de184b617aceeaf25818cc646de breaks update-grub
To: dsterba@suse.cz
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, Anand Jain <anand.jain@oracle.com>, 
	CHECK_1234543212345@protonmail.com, brauner@kernel.org, 
	linux-btrfs <linux-btrfs@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i can confirm that with this patch applied on top of 6.8-rc3 i can now
run update-grub. thank you. checked the kernel logs for btrfs related
messages and everything seems fine:

Btrfs loaded, zoned=3Dno, fsverity=3Dno
BTRFS: device fsid 695aa7ac-862a-4de3-ae59-c96f784600a0 devid 1
transid 1990924 /dev/root scanned by swapper/0 (1)
BTRFS info (device nvme0n1p3): first mount of filesystem
695aa7ac-862a-4de3-ae59-c96f784600a0
BTRFS info (device nvme0n1p3): using crc32c (crc32c-generic) checksum algor=
ithm
BTRFS info (device nvme0n1p3): disk space caching is enabled
VFS: Mounted root (btrfs filesystem) readonly on device 0:19.
BTRFS info (device nvme0n1p3): the free space cache file
(604538667008) is invalid, skip it
BTRFS info: devid 1 device path /dev/root changed to /dev/nvme0n1p3
scanned by (udev-worker) (277)
BTRFS info (device nvme0n1p3): the free space cache file
(675405627392) is invalid, skip it
BTRFS info (device nvme0n1p3): the free space cache file
(696880463872) is invalid, skip it
BTRFS info (device nvme0n1p3): the free space cache file
(725871493120) is invalid, skip it
BTRFS info (device nvme0n1p3): the free space cache file
(799959678976) is invalid, skip it
BTRFS info (device nvme0n1p3): the free space cache file
(1658160414720) is invalid, skip it

not sure what's going on with the free space cache file, it wasn't
that long ago i mounted the disk with the clear_cache option after
which those messages disappeared but now it's back again...

--alex--

On Mon, Feb 5, 2024 at 12:26=E2=80=AFPM David Sterba <dsterba@suse.cz> wrot=
e:
>
> On Sun, Feb 04, 2024 at 07:29:29PM +0100, Alex Romosan wrote:
> > sorry about the html post (in case somebody actually got it). as i was
> > saying, just for the record it's still not fixed in 6.8-rc3. thanks.
>
> I've updated the bug with link to fix
>
> https://github.com/kdave/btrfs-devel/commit/b80f3ec6592c69f88ebc74a4e1667=
6af161e2759
>
> but would like to ask for testing.
