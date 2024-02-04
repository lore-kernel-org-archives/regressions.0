Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780CA24A04
	for <regressions@lists.linux.dev>; Sun,  4 Feb 2024 18:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707071383; cv=none; b=fYmrflbdvft2UHShctbfAtw2fj47pOKuz4qo99XKotlWy3jG2Uvhj7Gl10LC932/WJLjE+ydf8VSrxawBxpuB4FgpK0pK3dZUjHr2JM4hgq3u3jna/+tEscaC1f9hMT4U2gUYSF5+BTIs2s0L4iNaCfTZgS/xnof7zH0RtcVCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707071383; c=relaxed/simple;
	bh=hSrMj/wKl5jffrFRZdmR/3NGB6Wc3DAA5zwdOPruqes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dgkf4eoMq85BRg7TnRunug65C8n0EX+PSrwTCUrkQMU9wArUcdA7p0Bjyo6TAo3ovoMCPASkSwUO0QUuPenJCNBHwvn9POi+N+uY0UB4YbWoFDb5YpaIhkxnaj1KwC9aAHWdDV4SWTR7y4OeOZ7pditSiVbn+GHRtns2pq0n3y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3nbFgA4; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3nbFgA4"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc236729a2bso3505366276.0
        for <regressions@lists.linux.dev>; Sun, 04 Feb 2024 10:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707071380; x=1707676180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m96LY0uzgcQpdT6g6uTesfbb0UhPXpBOxu8i3g30yqk=;
        b=B3nbFgA4xnJRi4jwfs4x1MjTCGpaTe9x8k2nkqGh0cpXJfl7rYcpJ40I8bOforCreK
         Xe0BrT6n45oZ79PDpHd9zd2Hd5bSgeIkTlmttng6qUWd8Nvt1WnHVbWasrAQlkQeAP10
         KxRKokdalBltrOWlmecO+TzDjhjmXHjzRKhihEbyjKVdkuyICyMIXSkx2LPLN55rQB9S
         2T/+8BcIVtgpZugWahDy8SMCxbwAzdjveeKeJocATP0TvH9WM3dvyib0teYyfUjxsxm+
         vVWQw4WWl1pK/lmMKFG3SDAjm77GogIfuO5GTng3ab+KyA+KiDMeU4Pn9OY7ZypUSve1
         0hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707071380; x=1707676180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m96LY0uzgcQpdT6g6uTesfbb0UhPXpBOxu8i3g30yqk=;
        b=vdDbj1YElywuNp4d3Ruc0lLjBdiGEvbEtOX3SFl++uJQloTXUBkk3j7o3e2u9XZJlS
         WdQuoWI+o1Jy5L1PDJ7TdiEVaukI3tm57P2ahW/GiG93RxrWhExt+IIv59NxQpWShTl4
         /OLj2zA1QTdOuxGvBopLkelH11dYHrlMl/HFCBdbqsbCyhNj4iv9lKh584QFxo+IJ+Yp
         7cztTaM13VQwL1MJmoxVqGjQIUpAQi5BckMHp2em8nQBAl2Uwv8bY9I2qRw/piHZyD0g
         mO0UVkSeXEuQvHOP5JOLOZYRTEM8+MKWK4U2MeFDSqTwfF/gNZD67vnKEK7RaR78E7gz
         /oVw==
X-Gm-Message-State: AOJu0Yyy9BG0JqnwllGqZhBf6z89tzLt/CMbDBkr1Riz0IV/NuD57nyO
	RhwUsEraX7tsZhW3Luy6w3DXK5xeU4faiJjBuQbk1x/kYcsVZau0tz9B9HdFZ/pAIluRiOIfNRI
	Kb7kUiyRRsEPyzwgH84GDkf1tIN9UtdUYPLilBA==
X-Google-Smtp-Source: AGHT+IEXCbTvDA0iJAaac8Y5USeXLLy6UhROXRNUCWy/ZNfRAzqhs20pk+lfcfQI+I7p7pEEZBzKucHWWpofhOhAZk4=
X-Received: by 2002:a25:d389:0:b0:dc2:4450:92f2 with SMTP id
 e131-20020a25d389000000b00dc2445092f2mr10449381ybf.22.1707071380099; Sun, 04
 Feb 2024 10:29:40 -0800 (PST)
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
In-Reply-To: <CAKLYgeLhcE5+Td9eGKAi0xeXSsom381RxuJgKiQ0+oHDNS_DJA@mail.gmail.com>
From: Alex Romosan <aromosan@gmail.com>
Date: Sun, 4 Feb 2024 19:29:29 +0100
Message-ID: <CAKLYgeKCuDmnuGHuQYPdZZA1_H3s9_9oh+vT_FMpFZqxKSvjzw@mail.gmail.com>
Subject: Re: [btrfs] commit bc27d6f0aa0e4de184b617aceeaf25818cc646de breaks update-grub
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Anand Jain <anand.jain@oracle.com>, CHECK_1234543212345@protonmail.com, 
	brauner@kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, 
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, dsterba@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sorry about the html post (in case somebody actually got it). as i was
saying, just for the record it's still not fixed in 6.8-rc3. thanks.


On Sun, Feb 4, 2024 at 7:27=E2=80=AFPM Alex Romosan <aromosan@gmail.com> wr=
ote:
>
> just for the record it's still not fixed in 6.8-rc3 (obviously, since i'v=
e been looking at the btrfs patches being applied).
>
> On Thu, Feb 1, 2024 at 11:25=E2=80=AFAM Linux regression tracking (Thorst=
en Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
>> for once, to make this easily accessible to everyone.
>>
>> Anand, what's the status wrt to below issue (which afaics seems to
>> affect quite a few people)? Things look stalled, but I might be missing
>> something, that's why I ask for a quick update.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot poke
>>
>> On 12.01.24 00:24, Anand Jain wrote:
>> > On 11/01/2024 22:36, David Sterba wrote:
>> >> On Thu, Jan 11, 2024 at 04:50:56PM +0100, David Sterba wrote:
>> >>> On Thu, Jan 11, 2024 at 12:45:50PM +0100, Thorsten Leemhuis wrote:
>> >>>>
>> >>>> On 08.01.24 15:11, Alex Romosan wrote:
>> >>>>>
>> >>>>> Running my own compiled kernel without initramfs on a lenovo think=
pad
>> >>>>> x1 carbon gen 7.
>> >>>>>
>> >>>>> Since version 6.7-rc1 i haven't been able to to a grub-update,
>> >>>>>
>> >>>>> instead i get this error:
>> >>>>>
>> >>>>> grub-probe: error: cannot find a device for / (is /dev mounted?) s=
olid
>> >>>>> state drive
>> >>>>>
>> >>>>> 6.6 was the last version that worked.
>> >>>>>
>> >>>>> Today I did a git-bisect between these two versions which identifi=
ed
>> >>>>> commit bc27d6f0aa0e4de184b617aceeaf25818cc646de btrfs: scan but do=
n't
>> >>>>> register device on single device filesystem as the culprit. revert=
ing
>> >>>>> this commit from 6.7 final allowed me to run update-grub again.
>> >>>>>
>> >>>>> not sure if this is the intended behavior or if i'm missing some o=
ther
>> >>>>> kernel options. any help/fixes would be appreciated.
>> >>>>
>> >>>> Thanks for the report. To be sure the issue doesn't fall through th=
e
>> >>>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regres=
sion
>> >>>> tracking bot:
>> >>>>
>> >>>> #regzbot ^introduced bc27d6f0aa0e4de184b617aceeaf25818cc646de
>> >>>> #regzbot title btrfs: update-grub broken (cannot find a device for =
/
>> >>>> (is
>> >>>> /dev mounted?))
>> >>>> #regzbot ignore-activity
>> >>>
>> >>> The bug is also tracked at
>> >>> https://bugzilla.kernel.org/show_bug.cgi?id=3D218353 .
>> >>
>> >> About the fix: we can't simply revert the patch because the temp_fsid
>> >> depends on that. A workaround could be to check if the device path is
>> >> "/dev/root" and still register the device. But I'm not sure if this d=
oes
>> >> not break the use case that Steamdeck needs, as it's for the root
>> >> partition.
>> >
>> >
>> > Thank you for the report.
>> >
>> > The issue seems more complex than a simple scenario, as the following
>> > test-case works well:
>> >
>> >   $ mount /dev/sdb1 /btrfs
>> >   $ cat /proc/self/mountinfo | grep btrfs
>> > 345 63 0:34 / /btrfs rw,relatime shared:179 - btrfs /dev/sdb1
>> > rw,space_cache=3Dv2,subvolid=3D5,subvol=3D/
>> >
>> > However, the relevant part of the commit
>> > bc27d6f0aa0e4de184b617aceeaf25818cc646de that may be failing could
>> > be in identifying a device, whether it is the same or different
>> > For this, we use:
>> >
>> >      lookup_bdev(path, &path_devt);
>> >
>> > and match with the devt(MAJ:MIN) saved in the btrfs_device;
>> > would this work during initrd? I need to dig more. Trying
>> > to figure out how can I reproduce this.
>> >
>> > Thanks, Anand
>> >
>> >
