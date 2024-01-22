Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB640161
	for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 00:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705882034; cv=none; b=p0+AGytUulwqjtuA5EO6fe5Nl79mTva3N0tdkkl/LSBoZH2bHMwU3a/c2dJduequaz184Mkft8Yg4TOHXhJ1XVkOdSALLRcdnNJuz4AG9vilAQPQLFUC3HSrsTLsf2gBeamf/puXfYZvxzizG8OUlJBEudtuBQoSmWOfKWZACDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705882034; c=relaxed/simple;
	bh=v0w0LJ3uf4foFHSK8n0QTLvlcutBJjyEkJg91UgDdkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ak/JiOzrTkjjQOW0eSU+4gUSRFQ+5X2a5nBpqELRYFJr1NQMAkqg7nt1FYzFm0oOyPCf5yPkNv4aDcKC6HFG2XK/M/lzH0sakqzYHrFE4TVSMnmVoZGlkmrEYWSD+mwcmuNqkHtRuKOo569sDaQk51qG/QhZQXHDHoupOrLkn9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gXczUuPU; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gXczUuPU"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc261316b0dso1792337276.3
        for <regressions@lists.linux.dev>; Sun, 21 Jan 2024 16:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705882032; x=1706486832; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXaDrO6PrF2cmqEQPuS3YomJWnmAlkY/6Wq6iuyjQCw=;
        b=gXczUuPUyhops31DV+c/xSNo56owL5OLjWSmRTYFIJLdh+HShDiWNqYviV4RHJCKE+
         gNspGRnVHCVSmsNbAdD97KsW5WHmzuv0euqeI2qLPInVUA+XwWmkuZ7Dygg37eZQpx5H
         uXWapmpAl+3ueN0JbH5gdUhEpm6oGUZ3yrP0DDxbVYhBzIZO0qrb/M1GKR0lrP+qj0ms
         efLalK88DZCrtMYjEcl5fyL83G8jyM+mCQKK5QYTstZ6msilGVB+hh8NpctiKFgriY40
         PwlFIBas9ixI5wVkMj9ziVzmcqwkyhHt/86aFZCaV/GAiDfRPqXwIJjS8T8M06U1XATh
         jrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705882032; x=1706486832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXaDrO6PrF2cmqEQPuS3YomJWnmAlkY/6Wq6iuyjQCw=;
        b=tnenVGKXWJzRKtQJ/hFCNtFBt5Jfl321LI60tqAVr4sRv9v7CyNKMgwgmA4rkTQ9g7
         3iHkOvr9Jd7uRLymgK6LYX8cYSLKY2xFPGh23F4fOYsEJKyBPXU4bLDeOPBz1Ys4dKeE
         vL4pIXrgiw4MPYfHOHX/f5LILqaSWXY1Bd9epsXVkLU42z1uZD9mhKq/ubVZJF3ypMWa
         bq23kMcdvmrxSzOZD/JmYbI+SWlcjp4/e2K14KATcnNlWJ+6MMRGJt3LzrTzEXtSV6CN
         qfVEwyrOOj5f4eLw64AUigs+tf9XVTc55snOsmNIstO/1AG5OWSijkzrksRxBG6oyoGH
         cKyQ==
X-Gm-Message-State: AOJu0YyprAUuOHUlFZQgbTKZy49JTXXhQxcs45KFDLS47qa7K+i/qXjv
	IIT+35ls+vZmcesrT5mjOEWcS33guYwmPmw1sEsViy6S0KUYFrZVWvysw0ULKECB+bIFblenI6M
	8jZmoFH7Zfd/F8KMSQnD4YEPFy3E=
X-Google-Smtp-Source: AGHT+IGfIyZs2JIgn0r3Ml/E3UHsh7sPDcPhsDbKTC7E6gcGm2WrFhJcxFItNZ+lNdG5XLiux+DMqyIIdu1HWiJUbcg=
X-Received: by 2002:a25:ea11:0:b0:dbe:6596:4813 with SMTP id
 p17-20020a25ea11000000b00dbe65964813mr1304993ybd.24.1705882031736; Sun, 21
 Jan 2024 16:07:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKLYgeJ1tUuqLcsquwuFqjDXPSJpEiokrWK2gisPKDZLs8Y2TQ@mail.gmail.com>
 <39e3a4fe-d456-4de4-b481-51aabfa02b8d@leemhuis.info> <20240111155056.GG31555@twin.jikos.cz>
 <20240111170644.GK31555@twin.jikos.cz> <f45e5b7c-4354-87d3-c7f1-d8dd5f4d2abd@oracle.com>
In-Reply-To: <f45e5b7c-4354-87d3-c7f1-d8dd5f4d2abd@oracle.com>
From: Alex Romosan <aromosan@gmail.com>
Date: Mon, 22 Jan 2024 01:07:01 +0100
Message-ID: <CAKLYge+x9kxLBaJGyk_gTMK2kQ=+Lhg00jgXe=P=jmBUq=cmfA@mail.gmail.com>
Subject: Re: [btrfs] commit bc27d6f0aa0e4de184b617aceeaf25818cc646de breaks update-grub
To: Anand Jain <anand.jain@oracle.com>
Cc: CHECK_1234543212345@protonmail.com, brauner@kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>, linux-kernel@vger.kernel.org, 
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, dsterba@suse.cz
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

update-grub still doesn't work 6.8-rc1

so i did:

# cat /proc/self/mountinfo | grep btrfs
21 1 0:19 / / rw,relatime shared:1 - btrfs /dev/root
rw,ssd,discard=3Dasync,space_cache,subvolid=3D5,subvol=3D/

the difference from your test case is that it doesn't reference
the disk device but /dev/root which on my system doesn't exist. could this
be the problem?

--alex--


On Fri, Jan 12, 2024 at 12:24=E2=80=AFAM Anand Jain <anand.jain@oracle.com>=
 wrote:
>
>
>
> On 11/01/2024 22:36, David Sterba wrote:
> > On Thu, Jan 11, 2024 at 04:50:56PM +0100, David Sterba wrote:
> >> On Thu, Jan 11, 2024 at 12:45:50PM +0100, Thorsten Leemhuis wrote:
> >>> [Adding Anand Jain, the author of the culprit to the list of recipien=
ts;
> >>> furthermore CCing the the Btrfs maintainers and the btrfs list; also
> >>> CCing regression list, as it should be in the loop for regressions:
> >>> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> >>>
> >>> On 08.01.24 15:11, Alex Romosan wrote:
> >>>> Please Cc me as I am not subscribed to the list.
> >>>>
> >>>> Running my own compiled kernel without initramfs on a lenovo thinkpa=
d
> >>>> x1 carbon gen 7.
> >>>>
> >>>> Since version 6.7-rc1 i haven't been able to to a grub-update,
> >>>>
> >>>> instead i get this error:
> >>>>
> >>>> grub-probe: error: cannot find a device for / (is /dev mounted?) sol=
id
> >>>> state drive
> >>>>
> >>>> 6.6 was the last version that worked.
> >>>>
> >>>> Today I did a git-bisect between these two versions which identified
> >>>> commit bc27d6f0aa0e4de184b617aceeaf25818cc646de btrfs: scan but don'=
t
> >>>> register device on single device filesystem as the culprit. revertin=
g
> >>>> this commit from 6.7 final allowed me to run update-grub again.
> >>>>
> >>>> not sure if this is the intended behavior or if i'm missing some oth=
er
> >>>> kernel options. any help/fixes would be appreciated.
> >>>>
> >>>> thank you.
> >>>
> >>> Thanks for the report. To be sure the issue doesn't fall through the
> >>> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regressi=
on
> >>> tracking bot:
> >>>
> >>> #regzbot ^introduced bc27d6f0aa0e4de184b617aceeaf25818cc646de
> >>> #regzbot title btrfs: update-grub broken (cannot find a device for / =
(is
> >>> /dev mounted?))
> >>> #regzbot ignore-activity
> >>
> >> The bug is also tracked at https://bugzilla.kernel.org/show_bug.cgi?id=
=3D218353 .
> >
> > About the fix: we can't simply revert the patch because the temp_fsid
> > depends on that. A workaround could be to check if the device path is
> > "/dev/root" and still register the device. But I'm not sure if this doe=
s
> > not break the use case that Steamdeck needs, as it's for the root
> > partition.
>
>
> Thank you for the report.
>
> The issue seems more complex than a simple scenario, as the following
> test-case works well:
>
>    $ mount /dev/sdb1 /btrfs
>    $ cat /proc/self/mountinfo | grep btrfs
> 345 63 0:34 / /btrfs rw,relatime shared:179 - btrfs /dev/sdb1
> rw,space_cache=3Dv2,subvolid=3D5,subvol=3D/
>
> However, the relevant part of the commit
> bc27d6f0aa0e4de184b617aceeaf25818cc646de that may be failing could
> be in identifying a device, whether it is the same or different
> For this, we use:
>
>       lookup_bdev(path, &path_devt);
>
> and match with the devt(MAJ:MIN) saved in the btrfs_device;
> would this work during initrd? I need to dig more. Trying
> to figure out how can I reproduce this.
>
> Thanks, Anand
