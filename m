Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA892C158A
	for <regressions@lists.linux.dev>; Mon, 15 Dec 2025 04:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765773904; cv=none; b=fhCDcatofnq3ynL147FuhO3P4GobPJNkLkcqfOpJqXL+SiS/okYZiuPp0qFon42JbbODKs3fUY0U4FUx1fUoZv5+rKm6HAWgN8gM1y8XZxgMP3Gz8g9ldGG/CCso1SP0OUFoxRlnE7GKNhgAxDsdI+Xvac/rEVgae/jjCi8fGdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765773904; c=relaxed/simple;
	bh=7PisnT3hiijUh9oixgDdlnQnza1382MErLdvnXuWzWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=He1Cqz8nWbc7hCmLBve4ci6m3wYyND3vSwUgcIUJnDiApCh0uoal9QBzC8hsSC+wVl0Q1n34ohCBA9M7KkdfNQ+p1D3uBt5dliA11gugyWVGDwCwZzjHZzcqBoeL2iFG2v6Ls8ELCPYnb794ybojCK/M2OOKdfdLdK7Bf+axryA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AAIBL0CU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AAIBL0CU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so458766f8f.3
        for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 20:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765773901; x=1766378701; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ML0r7ObM9/T5sg62BeFcZqS/ja5rEbtFn4IwdOlHqiw=;
        b=AAIBL0CUfzvIU/VC5HhXBR1FWWk6RvorwWEZqc4M1YeJmdlrSYAOq+x4sllbZLS5H/
         LYIYoAShxFEMwzYn26R9bmlTp4b2LPZ0mN9dOpDt2qkgW4dvZxTuyfyl9G/nh4zi2Qeh
         jSDxSziiV+z8OzanTU2M9eiPaCLpbFLMR8RAN8qsKJKOwtmTsLDcxhLpB1moIcfOYgLx
         laBQ4ffc3druiYwm1UBnZpDNKynaYZv7Bzqj7p9kQYc88TRjsEQYHQCFKjzxLFZIpAAa
         KykB2l8LrO6EpXi2qSJx3FeEfp+zwEqH/qSDRuTtuyBgK7AuUbMDXek+PYWL9uCLXeTy
         zPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765773901; x=1766378701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ML0r7ObM9/T5sg62BeFcZqS/ja5rEbtFn4IwdOlHqiw=;
        b=X5CUrpoohbOwM+Z70eYYiIJoWVnXszZ4HbLpb5ZI+8UCDBQyWT/Mp/pu3Vr+JZ1mlT
         rgpJjYgblEXGh+JtUui0Fe2IrAJxblQd8vRB3OkeVFOz/w2ooiM8UfFnoIcCuuaiFj6t
         UoZ1iZP+KGSspA2y+GdFlKfs+k88dgN4zWUpxTnZdfe0Onfnek+d1kNNUgO2dymKvsJY
         jp0th5PDMUhu0guQdts5DcpB2KuaTZmhsEqToZYP7m3yFTC82cIelP7PwSmT9x1wubsV
         0kcF23uPZaUmLbtrIzM7Ycekg1g6t7Dr7enYQl6/M9xdvY5pos568hy/GxMV1TKA/7Ii
         IGeA==
X-Forwarded-Encrypted: i=1; AJvYcCV/aWgKVQIeBcPeImBtEncjYEZ6fKZT1mohMnUWPuMr5y9FG2CjceAa8wabYClFxNlH/TCj3StjBEQJ0Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzfuYadYAlL/hqRYzgMIi1Dd+hfWosozUYlfxsnpAQ0IB3j/5B
	h6ostFb95f12o0XrvTkKAc0EfxQktSn+YS/CTeg8oitPOns6FS/gmPfh
X-Gm-Gg: AY/fxX4M+whyv8Y9QNQiZ90G2fcG5geKzJraAlVyS1xZEktpIVbLxuOdAxIcY4q1jIf
	3kq7vaBJlo4ax2n1GE0s2AtTXAEylsDVr3KEeJndGnw1YYLq9WLWlqXMXm0KrSMEk5bwSttPJ/o
	4wSZ6CxZIE1sG32F3DxUKfXCvEwwq35F0MFHslZwA8wiGzIFkkzUyZkoo8Z0SOD7bveGcunmCLr
	hNvXkXRbcUQlqRIwBOks7gCmbQlPnufWoGB2mCse2mqknkPoNFDxw1CIURNRLC7eXZe9FviyOQJ
	LCya06h1QphTuT9SQVC1tCU5xzNq1t9iXFO+gJxjgECFgUMaRPMOszzWWP1s6ahdO2IhNpyZ+F8
	kFlJqwUI/ln+qKcQDl/XQwSOTX6S5RgfQrEVuTOj99ctejDLGArq/rk7TJlD79FR8kDC/oMFNUP
	zg05OL+9V1AU/+Egjx5MBTGCorMlwDwJRiI1kGs5UcUFnn
X-Google-Smtp-Source: AGHT+IGW/x/KIsUSoYUE4Tp2R5V0W8WENFntKgFb/J7RE0N6Iq/+aWtRub+6skayu3CX1CkhCxZQTQ==
X-Received: by 2002:a05:6000:601:b0:430:fd0f:290c with SMTP id ffacd0b85a97d-430fd0f2c21mr1774879f8f.41.1765773900340;
        Sun, 14 Dec 2025 20:45:00 -0800 (PST)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ff626b591sm14288366f8f.15.2025.12.14.20.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 20:44:59 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 02360BE2EE7; Mon, 15 Dec 2025 05:44:57 +0100 (CET)
Date: Mon, 15 Dec 2025 05:44:57 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: =?iso-8859-1?Q?J=2E_Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	1120058@bugs.debian.org, Jingbo Xu <jefflexu@linux.alibaba.com>,
	Jeff Layton <jlayton@kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [regression] 0c58a97f919c ("fuse: remove tmp folio for
 writebacks and internal rb tree") results in suspend-to-RAM hang on AMD
 Ryzen 5 5625U on test scenario involving podman containers, x2go and openjdk
 workload
Message-ID: <aT-SSeAqz3bF5iHw@eldamar.lan>
References: <aQrcFyO7tlFF0TyD@lorien.valinor.li>
 <aSl-iAefeJJfjPJB@probook>
 <aSoBsX5MZXYCq2qZ@eldamar.lan>
 <176227232774.2636.13973205036417925311.reportbug@probook>
 <aSxCcapas1biHwBk@probook>
 <aT7JRqhUvZvfUQlV@eldamar.lan>
 <CAJnrk1Ygu_erR0W2wTOdYzVhm2ZowWDdULQbXpp2AZR1Y=jkJA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJnrk1Ygu_erR0W2wTOdYzVhm2ZowWDdULQbXpp2AZR1Y=jkJA@mail.gmail.com>

Hi Joanne,

On Mon, Dec 15, 2025 at 06:37:42AM +0800, Joanne Koong wrote:
> On Sun, Dec 14, 2025 at 10:27 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
> >
> > Hi Joanne,
> >
> > In Debian J. Neuschäfer reported an issue where after 0c58a97f919c
> > ("fuse: remove tmp folio for writebacks and internal rb tree") a
> > specific, but admittely not very minimal workload, involving podman
> > contains, x2goserver and a openjdk application restults in
> > suspend-to-ram hang.
> >
> > The report is at https://bugs.debian.org/1120058 and information on
> > bisection and the test setup follows:
> >
> > On Sun, Nov 30, 2025 at 02:11:13PM +0100, J. Neuschäfer wrote:
> > > On Fri, Nov 28, 2025 at 09:10:25PM +0100, Salvatore Bonaccorso wrote:
> > > > Control: found -1 6.17.8-1
> > > >
> > > > Hi,
> > > >
> > > > On Fri, Nov 28, 2025 at 11:50:48AM +0100, J. Neuschäfer wrote:
> > > > > On Wed, Nov 05, 2025 at 06:09:43AM +0100, Salvatore Bonaccorso wrote:
> > > [...]
> > > > > I can reproduce the bug fairly reliably on 6.16/17 by running a specific
> > > > > podman container plus x2go (not entirely sure which parts of this is
> > > > > necessary).
> > > >
> > > > Okay if you have a very reliable way to reproduce it, would you be
> > > > open to make "your hands bit dirty" and do some bisecting on the
> > > > issue?
> > >
> > > Thank you for your detailed instructions! I've already started and completed
> > > the git bisect run in the meantime. I had to restart a few times due to
> > > mistakes, but I was able to identify the following upstream commit as the
> > > commit that introduced the issue:
> > >
> > > https://git.kernel.org/linus/0c58a97f919c24fe4245015f4375a39ff05665b6
> > >
> > >     fuse: remove tmp folio for writebacks and internal rb tree
> > >
> > > The relevant commit history is as follows:
> > >
> > >   *   2619a6d413f4c3 Merge tag 'fuse-update-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse  <-- bad
> > >   |\
> > >   | * dabb9039102879 fuse: increase readdir buffer size
> > >   | * 467e245d47e666 readdir: supply dir_context.count as readdir buffer size hint
> > >   | * c31f91c6af96a5 fuse: don't allow signals to interrupt getdents copying
> > >   | * f3cb8bd908c72e fuse: support large folios for writeback
> > >   | * 906354c87f4917 fuse: support large folios for readahead
> > >   | * ff7c3ee4842d87 fuse: support large folios for queued writes
> > >   | * c91440c89fbd9d fuse: support large folios for stores
> > >   | * cacc0645bcad3e fuse: support large folios for symlinks
> > >   | * 351a24eb48209b fuse: support large folios for folio reads
> > >   | * d60a6015e1a284 fuse: support large folios for writethrough writes
> > >   | * 63c69ad3d18a80 fuse: refactor fuse_fill_write_pages()
> > >   | * 3568a956932621 fuse: support large folios for retrieves
> > >   | * 394244b24fdd09 fuse: support copying large folios
> > >   | * f09222980d7751 fs: fuse: add dev id to /dev/fuse fdinfo
> > >   | * 18ee43c398af0b docs: filesystems: add fuse-passthrough.rst
> > >   | * 767c4b82715ad3 MAINTAINERS: update filter of FUSE documentation
> > >   | * 69efbff69f89c9 fuse: fix race between concurrent setattrs from multiple nodes
> > >   | * 0c58a97f919c24 fuse: remove tmp folio for writebacks and internal rb tree              <-- first bad commit
> > >   | * 0c4f8ed498cea1 mm: skip folio reclaim in legacy memcg contexts for deadlockable mappings
> > >   | * 4fea593e625cd5 fuse: optimize over-io-uring request expiration check
> > >   | * 03a3617f92c2a7 fuse: use boolean bit-fields in struct fuse_copy_state
> > >   | * a5c4983bb90759 fuse: Convert 'write' to a bit-field in struct fuse_copy_state
> > >   | * 2396356a945bb0 fuse: add more control over cache invalidation behaviour
> > >   | * faa794dd2e17e7 fuse: Move prefaulting out of hot write path
> > >   | * 0486b1832dc386 fuse: change 'unsigned' to 'unsigned int'
> > >   *   0fb34422b5c223 Merge tag 'vfs-6.16-rc1.netfs' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs   <-- good
> > >
> > > The first and last commits shown are merge commits done by Linus Torvalds. The
> > > fuse-update branch was based on v6.15-rc1, under which I can't run my test due
> > > to an unrelated bug, so I ended up merging in 0fb34422b5c223 to test the
> > > commits within the fuse-update branch. e.g.:
> > >
> > >   git reset --hard 394244b24fdd09 && git merge 0fb34422b5c223 && make clean && make
> > >
> > >
> > > I have also verified that the issue still happens on v6.18-rc7 but I wasn't
> > > able to revert 0c58a97f919 on top of this release, because a trivial revert
> > > is not possible.
> > >
> > > My test case consists of a few parts:
> > >
> > >  - A podman container based on the "debian:13" image (which points to
> > >    docker.io/library/debian via /etc/containers/registries.conf.d/shortnames.conf),
> > >    where I installed x2goserver and a openjdk-21-based application; It runs the
> > >    OpenSSH server and port 22 is exposed as localhost:2001
> > >  - x2goclient to start a desktop session in the container
> > >
> > > Source code: https://codeberg.org/neuschaefer/re-workspace
> > >
> > > I suspect, but haven't verified, that the X server in the container somehow
> > > uses the FUSE-emulated filesystem in the container to create a file that is
> > > used with mmap (perhaps to create shared pages as frame buffers).
> > >
> > >
> > > Raw bisect notes:
> > >
> > > good:
> > > - v6.12.48+deb13-amd64
> > > - v6.12.59
> > > - v6.12
> > > - v6.14
> > > - v6.15-1304-g14418ddcc2c205
> > > - v6.15-10380-gec71f661a572
> > > - v6.15-10888-gb509c16e1d7cba
> > > - v6.15-rc7-357-g8e86e73626527e
> > > - v6.15-10933-g4c3b7df7844340
> > > - v6.15-10954-gd00a83477e7a8f
> > > - v6.15-rc7-366-g438e22801b1958 (CONFIG_X86_5LEVEL=y)
> > > - v6.15-rc4-126-g07212d16adc7a0
> > > - v6.15-10958-gdf7b9b4f6bfeb1    <-- first parent, 5LEVEL doesn't exist
> > > - v6.15-rc4-00127-g4d62121ce9b5
> > > - v6.15-rc7-375-g61374cc145f4a5  <-- second parent, `X86_5LEVEL=y`
> > > - v6.15-rc7-375-g61374cc145f4a5  <-- second parent, `X86_5LEVEL=n`
> > > - v6.15-11061-g7f9039c524a351: "first bad", actually good. merge of df7b9b4f6bfeb1 61374cc145f4a5
> > > - v6.15-11093-g0fb34422b5c223
> > > - v6.15-rc1-7-g0c4f8ed498cea1 + merge = v6.15-11101-gaec20ffad33068
> > >
> > > testing:
> > > - v6.18-rc7 + revert: doesn't apply
> > >
> > > weird (ssh doesn't work):
> > > - v6.15-rc1-1-g0486b1832dc386
> > > - v6.15-rc1-10-g767c4b82715ad3
> > > - v6.15-rc1-13-g394244b24fdd09: folio stuff
> > > - v6.15-rc1-22-gf3cb8bd908c72e
> > > - v6.15-rc1-23-gc31f91c6af96a5
> > > - next-20251128
> > >
> > > bad:
> > > - v6.15-rc1-8-g0c58a97f919c24 + merge = v6.15-11102-gdfc4869c8ef1f0  first bad commit
> > > - v6.15-rc1-9-g69efbff69f89c9 + merge = v6.15-11103-ga7b103c57680ce
> > > - v6.15-rc1-11-g18ee43c398af0b + merge = v6.15-11105-g4ad0d4fa61974c
> > > - v6.15-rc1-13-g394244b24fdd09 + merge = v6.15-11107-g37da056b3b873b
> > > - v6.15-11119-g2619a6d413f4c3: merge of 0fb34422b5c223 (last good) dabb9039102879 (fuse branch)
> > > - v6.15-11165-gfd1f8473503e5b: confirmed bad
> > > - v6.15-11401-g69352bd52b2667
> > > - v6.15-12422-g2c7e4a2663a1ab
> > > - regulator-fix-v6.16-rc2-372-g5c00eca95a9a20
> > > - v6.16.12
> > > - v6.16.12 again
> > > - v6.16.12+deb14+1-amd64
> > > - v6.18-rc7
> >
> > Would that ring some bells to you which make this tackable?
> 
> Hi Salvatore,
> 
> This looks like the same issue reported in this thread [1]. The lockup
> occurs when there's a faulty fuse server on the system that doesn't
> complete a write request. Prior to commit 0c58a97f919c24 ("fuse:
> remove tmp folio for writebacks and internal rb tree"), syncs on fuse
> filesystems were effectively no-ops. This patch upstream [2] reverts
> the behavior back to that. I'll send v2 of that patch and work on
> getting it merged as soon as possible.

Thank you and apologies I did miss the already reported issue.

J. Neuschäfer might it be possible you test the patch and report back
if that fixes your issue?

Regards,
Salvatore
