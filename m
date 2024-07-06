Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD57770E4
	for <regressions@lists.linux.dev>; Sat,  6 Jul 2024 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720267672; cv=none; b=ZhwDa/klk/Het+l4J6qnidj8+Wf/6gRSz1keojtbRUihJYmKRIa8OS3kNLXdB2X3ouoraN1kaLJZ9d6SHC97dV7OZs3clyCSp77XHJ1Yi5KQb+XmbNztKuxaRp3+dY/Xq1AQXIItMMxEzynkjuZjhzAVbvUV4ay8dWJgUzNG4pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720267672; c=relaxed/simple;
	bh=g130VdJy4X5RQveGbr0aWPyXnw4vw6OGxH70BzO++x0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z1MdBGWNkL5pUlKRpUViJHQandiiY0MFa/4CgRSkPjzI4lgPxjtMCGoEQedDSXzOI9eHH49wGpVvFObKF2OIbwo/WPpfFcVehJFhH9kAPzUtdvgx93UPy12Xj/aCLbP+eoFr4PHeW8bR0UzEO/4nQwIfsFWvYbVybDiZi9D3+iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6RCkI+X; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6RCkI+X"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-63036fa87dbso16517227b3.1
        for <regressions@lists.linux.dev>; Sat, 06 Jul 2024 05:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720267670; x=1720872470; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UqjVGacvr99k3S0wau6SJoKWQts7Y2bmo2bsBuOmljA=;
        b=X6RCkI+XM600NmM38uHELE8GY1P6hSN3dORxRwXk5lhzLi2/wMXJLB3LvJgr2Oumsb
         F8RNx8iSo0qPIZkr3kZGSXJchyeog8fIh5n7KTrEBifbtiZ3IZQSE9XxGsDb6262sm4p
         hztaK8cro6CppwyOZhcgOI20PD8FYEMFxvlUEZx/uXGeK2jK0TM1x+6nL0cYvX2QYYkn
         CU444vhGw7meg1ZAj1xIHKjsQS8NRltkxS6oZzpuWqRMEoOicbmT8nxvWkJ3BjB5JUjD
         Ms6AWNActxReGd6ekFVDkCwjdvUDShxiNxb41PhdhmHAgIvMODpb7vR6UM+pJj2xvyzq
         F9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720267670; x=1720872470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UqjVGacvr99k3S0wau6SJoKWQts7Y2bmo2bsBuOmljA=;
        b=fBwuXw/HolaXC3Gqvb58ptflQukEboH1BhHMOVoSUccMfWetxateQiKkccxOJTidtL
         IFxBOj3kJmZizWd+8UJxB0XkQA6YlJdrBezLhjHII3OgvnGy4I23bVLz7rGfOdv6bgRw
         4Io3B8/4yC+dkCP1ICiW5FkhBW6EfAgJPgBi8ICeZw8CM6nKH1HRL4ntW2k0tEK0elKB
         b5kIF/+tXc2H9zzaJXDKP4GwbgLnL2+a09XriEwiJvrOFt4hdaT1p3uzcuiYtcn/riA1
         5H+q/ifdrq9s3JHS+nByM9TYhdGYgrY4mjWNMyAIM8vrMKceeVFcsoKDvd9nVyANHNSf
         eB/A==
X-Forwarded-Encrypted: i=1; AJvYcCUC//G/5FoXW0IlowpfsXVE4CzE47xjRatBSHm0XtcsF6xxatCp1oyHjPcuYHho+O9pYFDWt0RS95T5xukhLgRPhMCtRAGqpUSFu6o=
X-Gm-Message-State: AOJu0YyMX7s2jYGZ+Lqj/c4WGc0/JWK6AoPykjRNdWVpVVqAZtD5l/cN
	mqpi6Ab6FW38mwhRLcVKW0MS5X2kt6etcsPhoxSjacPORaxEAcMHWaK3MDNHUeA9z9nDn2bajuG
	HcD3SwTMjsXHiZrHq3NYxPkCIPPQ=
X-Google-Smtp-Source: AGHT+IEBZ/FUz/DsO7jOLpOU0J6Jmcc/4QS4QIM895fzsXyrUnDATeRHsjxnAed8u+yDzbzNAiteUqr+agzXrZOR0OY=
X-Received: by 2002:a05:690c:f02:b0:62f:206e:c056 with SMTP id
 00721157ae682-652f5778c41mr49833507b3.5.1720267670059; Sat, 06 Jul 2024
 05:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
 <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
 <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com>
 <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com> <CAK-xaQaesuU-TjDQcXgbjoNbZa0Y2qLHtSu5efy99EUDVnuhUg@mail.gmail.com>
In-Reply-To: <CAK-xaQaesuU-TjDQcXgbjoNbZa0Y2qLHtSu5efy99EUDVnuhUg@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Sat, 6 Jul 2024 14:07:33 +0200
Message-ID: <CAK-xaQbcpzvH1uGiDa04g1NrQsBMnyH2z-FPC4CdS=GDfRCsLg@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno sab 6 lug 2024 alle ore 02:11 Andrea Gelmini
<andrea.gelmini@gmail.com> ha scritto:
> For the moment it seems we have a winner!

I confirm this, but I forgot to add this (a lot of these):
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm firefox-bin nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm firefox-bin nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:06 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2
[sab lug  6 13:12:07 2024] BTRFS warning (device dm-0): extent
shrinker already running, comm cc1plus nr_to_scan 2

Just for the record, compiling LibreOffice.

In the meanwhile running restic (full backup to force read
everything), no sluggish at all.
