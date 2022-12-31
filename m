Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD7028E2
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 11:58:10 +0000 (UTC)
Received: by mail-vs1-f52.google.com with SMTP id o63so18779418vsc.10
        for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 03:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cOrnvI0ab6Sjve5sOQHxemo9n/r3kg6EiJp9vkQUJjM=;
        b=MtKezjvPIsHhRoyFqHNbSAluvUbAQU6kH+LAM/3u5vWixb6DiaWyZerKZFFQAg0LTQ
         fuO9GKZZprt6hTT+8iQS2E4OTIg0FmmmGdjk4MehZlxsd+OTZe+QYa9n10Skw5HAJUfA
         mQ5C1IIVo/HURbj1GJZ3nezHvleoDkvknhKsnHKiof3DXn/DfRQSAF0VpY1sCLZgXzv5
         9U/uasy4pimNgWibwyjcskQFYzAKTU+GKJyPr1S4MVedrfCugz67m6ao+9ukPscUHInX
         GCg8NoPMirml/W5MORry72hXqJDdQgWYsFNtsjNv0MkAdEVCvZ2WwUSbC7P/mCGKSRlN
         hFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOrnvI0ab6Sjve5sOQHxemo9n/r3kg6EiJp9vkQUJjM=;
        b=LW5mYjz1jDlyUfkOWhVSJGXknH6U68TiiODc5eVCJLGE5uTsHDTl1glacscYJsrY9T
         hp4k8fCnDllzXkgc3Imcb0ovNjGtx9PDpNRMmbrtRJo7ya9JuNK+e0+nCFmU8ds94N9a
         HltxtK6NDwJyGQGrM/biwtZEqZMzVYQ87nnI+JU6aTOqKTn7NlE9ThrhehopnqosCTYl
         pC5P2ULaWzdZfRRqUeUtQQm1ecopuNhkh0428kAHE85UCJbNtozTFgBIkS26IMzPwH3r
         e17qmmd0j84FRmZECbh566B4lawLf7oLZe39bBl+7Lrs5JKT0H9M+laQVNgxJk6DgrAN
         txKg==
X-Gm-Message-State: AFqh2ko/nlqwjBprJiRtdp96vlhOOTGptccTFJGLHrcIFefmqirRyKVW
	UcqpzxtE7wA3JxEqlEbbLceWJsTkkHYCcKDaTi4=
X-Google-Smtp-Source: AMrXdXvmrFy/BahM6IhJ/dZcwp0qFkpovr9HhfOLOhDeYWbvUZXOjO5a/9D8fhZSd28YTNZEJ7ujRNGogWc/fSYVlSE=
X-Received: by 2002:a67:ee93:0:b0:3b2:a92d:a1f0 with SMTP id
 n19-20020a67ee93000000b003b2a92da1f0mr4111536vsp.46.1672487888989; Sat, 31
 Dec 2022 03:58:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAJw_Ztzyh-GNTJYpXbA0CeJv2Rz=fLZKE6_Q=7JMmM+s9yHXQ@mail.gmail.com>
 <CAAJw_Ztb0mJVkHtBhryf=9g8CA0fZZRa8HVio8GCGUSLOvqa7A@mail.gmail.com>
 <Y6bz4wOC0nwu2yGU@debian.me> <0c70ba66-ef00-7242-d198-844f803662fa@gmail.com>
 <CAAJw_Zv0iBg4rkzxQ2UOOLS9JQZ4cCmM7gSoDXec_gm-GggB6A@mail.gmail.com>
 <f500d64b-c26d-ee34-092a-421c64c69f9e@leemhuis.info> <Y66Hk6waTeXQDz1/@sol.localdomain>
 <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
In-Reply-To: <3dd9808e-ffbd-7959-2111-a9f13f2031f1@kernel.org>
From: Jeff Chua <jeff.chua.linux@gmail.com>
Date: Sat, 31 Dec 2022 19:57:58 +0800
Message-ID: <CAAJw_ZsLjw=+_oju-8Mxy-nEErUYc9ZPfDyX204yiJ7mA8u5gA@mail.gmail.com>
Subject: Re: Fwd: f2fs write error Linux v6.2
To: Chao Yu <chao@kernel.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Eric Biggers <ebiggers@kernel.org>, 
	lkml <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Bagas Sanjaya <bagasdotme@gmail.com>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, 
	F2FS Development <linux-f2fs-devel@lists.sourceforge.net>, 
	Linux Regressions <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, Dec 31, 2022 at 10:51 AM Chao Yu <chao@kernel.org> wrote:
>
> Hi Jeff,
>
> On 2022/12/30 14:39, Eric Biggers wrote:
> > If you could provide the mkfs and mount options you are using, and any other
> > relevant details, that would be helpful.  Bisection would also be very helpful,
> > as Thorsten mentioned.

I was just preparing my environment so I could hit the same issue
before I go for the bisect, so I don't need to reboot every time. Got
to a point where I could just qemu kvm + initrd ramdisk with / (f2fs)
and I could hit the problem almost every 8/10 runs just by doing
"mount -o remount /" and the system would freeze. That's good. I've a
good test case! ... and then I see Chao Yu's patch ...

> Other than that, I found some cases which can cause similar issue, so I figure
> out a patch for possible fixing, if you can have a try with it to check whether
> it can fix your issue, that would be helpful as well.
>
> https://lore.kernel.org/linux-f2fs-devel/20221230154332.5082-1-chao@kernel.org/T/#u

Ok, the patch seems to fix the problem. I'll run my qemu kvm
environment a few more times before I switch the real system. Because
it's not a that I could cause a real "mount -o remount /" freeze or
"vi /etc/passwd" fault all the time,

Will feedback soon. This would a very nice year end celebration so I
could move to 6.2.0-rc1.

Thank you!

Jeff
