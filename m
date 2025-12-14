Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7E328C2DD
	for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 22:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765751876; cv=none; b=bjVzFVBZxjHK6e2xCx1iu3URWX9EyuFT2YJ+tWcQB5863txJvvJykhyqro0iCADBAtDbHSFPCJ8hqMBCr3hnKI+n7hnQX0AmK8y22S/7oJFpp6VqAzjsRrmljl6zTPB3d2FiKtmTz+bhH+/ilPJj1pN5o9SBYl9ivZb2titqat0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765751876; c=relaxed/simple;
	bh=1uAi+RNxzYxgkWt0xKKWn3gHu5wikVugwnt7MQzKegE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ufDMpZ76V1jJ/XtPItMF1GPiqCOpTL5cQgL05du0dQY+5xr0B+DQS/3F8Qcq45L8V+YsHXEu1R9MTbn6ulR8YQGsI2uYFgsYafkwUfPzAakrD+Q2a3P2uoLf40z9msbuKK8oCCkV/tZtxMsMtPcTfWRjIt1DY8Q2bjcL1HhbJj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l5+EeF+0; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l5+EeF+0"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4edf1be4434so26569621cf.1
        for <regressions@lists.linux.dev>; Sun, 14 Dec 2025 14:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765751873; x=1766356673; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPvTv2eAhmiR8HsHyxzUsFmjPVlv6MaXSfs2JBCk7Hs=;
        b=l5+EeF+0YFakNuVwR05n6+qAFVr1DRTK/2zvM7CKr9n/DFWh7lDPEwCSDe0U+djlOr
         U32vRoFpTVHL27aCimXkDuK+gXXh4DK/U+NQ6xmYH5559N6+16UjtHa0PV4ymafn/fgg
         t4sHFG+DOAG+AWu3PGipTgQpRrJheXdgoZeLZH3T6xt9XQaKAe9qaLBvaB/q6Wf3rPND
         N5pYOnD8gJuAZ9TEcVTuC/Tgb4+OQjQ8v0oIu0K/HHYby6n4sT1ZhRGrMCTXmGtK5m0O
         0v4N8/YMg1Q+Yy/cgms1tlFxeI5gkuhNyVI8FTdFD4cn5pTcvAqYu4cLyOip3Ipy7NHO
         U77w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765751873; x=1766356673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPvTv2eAhmiR8HsHyxzUsFmjPVlv6MaXSfs2JBCk7Hs=;
        b=fV8ykNlPHFXgea/wngt0nwwCCS2SS35tB8XAZdBabMWsQsKEWKr9bGuIXjykROrHL2
         PM1mJOnquEbGs2er/BVPDzNdqJvXk4mQmLROSMlHuAQ3ec/htuUMAkdjCHRl288wb6y9
         NWDILG0/xqLq7a1v+LXeIC1SAi955Ay8vpD+FU4bKdR415/dJGsWyHGYRdV/6SKYBKa8
         x+NaOF8k/1a7HgWY/wggFEZbtOZdVVOd1iC+3S36qu4++Zef0euuS2Q/pCp/JVJ5LpS9
         LNMS33eaoGQMVSMgxlDxLqc1JOtKw4H7Gc18dp8NKm9ZuJQQAw0/Ius6UOriTbzmu0SM
         8QEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6+DDYul3H/p5BIo3Um6CG7EX2mODVSqhEhS85DTyvE3qroE5gNy+zR0jAUYhfr13djIkVdclYyC+s6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbfBwee/xnWZCvRHCROeva+ltk8WekdXftDOl85A9vMcZSxEP3
	RhtkPZsr9xZ8/BgmxrR4wI3wo68Xeo5HdGY8v9Frg+xjxU/qQsnhrvDXJyk+EuPpC7ljW4IJsn9
	U6TPmEA1BBBbtPLkH7XsPu2zU0zhkdk8=
X-Gm-Gg: AY/fxX5/lkypubspKMUQfyd5+tmd009a7dvnItxWPNOA0lQbeuNsjVVfXZaaxoZB4nW
	Rm7Lka06hh0Y+9OA3mPqQG66v2CC30q60fG4/T6PiRXpr8NP8ylYa3x919Tu7AjWMIBd9sJkLyp
	//q7n8g/6j41g2xnaIxRqh/2UFZjSy7qUKRESaOIE94pQlkBOb6GqjAszxAKfcYVwe4Dm5iS8ro
	jPKH+cucTuIblde0iU6bI8qQH3QfWbEkrtVKmY25C8OCha4MmgCoTF+oGDfFJXbsM7OCtE=
X-Google-Smtp-Source: AGHT+IFMze4iAWSbnl8GQ8LRhfKFq3P2SB8NOTF74xd09tcmqf6guMcHKxtL8XsgQtwr+UZRwExS2lDP/vVA56jcLWE=
X-Received: by 2002:ac8:5a47:0:b0:4ef:bd4a:e549 with SMTP id
 d75a77b69052e-4f1d05ee78emr143621891cf.60.1765751873569; Sun, 14 Dec 2025
 14:37:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aQrcFyO7tlFF0TyD@lorien.valinor.li> <aSl-iAefeJJfjPJB@probook>
 <aSoBsX5MZXYCq2qZ@eldamar.lan> <176227232774.2636.13973205036417925311.reportbug@probook>
 <aSxCcapas1biHwBk@probook> <aT7JRqhUvZvfUQlV@eldamar.lan>
In-Reply-To: <aT7JRqhUvZvfUQlV@eldamar.lan>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Mon, 15 Dec 2025 06:37:42 +0800
X-Gm-Features: AQt7F2pDbuJWxIj07OU9udOcPX645y6e721bw_8Z4E7kvANTtbB3cRxW3EoCEb4
Message-ID: <CAJnrk1Ygu_erR0W2wTOdYzVhm2ZowWDdULQbXpp2AZR1Y=jkJA@mail.gmail.com>
Subject: Re: [regression] 0c58a97f919c ("fuse: remove tmp folio for writebacks
 and internal rb tree") results in suspend-to-RAM hang on AMD Ryzen 5 5625U on
 test scenario involving podman containers, x2go and openjdk workload
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>, 
	1120058@bugs.debian.org, Jingbo Xu <jefflexu@linux.alibaba.com>, 
	Jeff Layton <jlayton@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 14, 2025 at 10:27=E2=80=AFPM Salvatore Bonaccorso <carnil@debia=
n.org> wrote:
>
> Hi Joanne,
>
> In Debian J. Neusch=C3=A4fer reported an issue where after 0c58a97f919c
> ("fuse: remove tmp folio for writebacks and internal rb tree") a
> specific, but admittely not very minimal workload, involving podman
> contains, x2goserver and a openjdk application restults in
> suspend-to-ram hang.
>
> The report is at https://bugs.debian.org/1120058 and information on
> bisection and the test setup follows:
>
> On Sun, Nov 30, 2025 at 02:11:13PM +0100, J. Neusch=C3=A4fer wrote:
> > On Fri, Nov 28, 2025 at 09:10:25PM +0100, Salvatore Bonaccorso wrote:
> > > Control: found -1 6.17.8-1
> > >
> > > Hi,
> > >
> > > On Fri, Nov 28, 2025 at 11:50:48AM +0100, J. Neusch=C3=A4fer wrote:
> > > > On Wed, Nov 05, 2025 at 06:09:43AM +0100, Salvatore Bonaccorso wrot=
e:
> > [...]
> > > > I can reproduce the bug fairly reliably on 6.16/17 by running a spe=
cific
> > > > podman container plus x2go (not entirely sure which parts of this i=
s
> > > > necessary).
> > >
> > > Okay if you have a very reliable way to reproduce it, would you be
> > > open to make "your hands bit dirty" and do some bisecting on the
> > > issue?
> >
> > Thank you for your detailed instructions! I've already started and comp=
leted
> > the git bisect run in the meantime. I had to restart a few times due to
> > mistakes, but I was able to identify the following upstream commit as t=
he
> > commit that introduced the issue:
> >
> > https://git.kernel.org/linus/0c58a97f919c24fe4245015f4375a39ff05665b6
> >
> >     fuse: remove tmp folio for writebacks and internal rb tree
> >
> > The relevant commit history is as follows:
> >
> >   *   2619a6d413f4c3 Merge tag 'fuse-update-6.16' of git://git.kernel.o=
rg/pub/scm/linux/kernel/git/mszeredi/fuse  <-- bad
> >   |\
> >   | * dabb9039102879 fuse: increase readdir buffer size
> >   | * 467e245d47e666 readdir: supply dir_context.count as readdir buffe=
r size hint
> >   | * c31f91c6af96a5 fuse: don't allow signals to interrupt getdents co=
pying
> >   | * f3cb8bd908c72e fuse: support large folios for writeback
> >   | * 906354c87f4917 fuse: support large folios for readahead
> >   | * ff7c3ee4842d87 fuse: support large folios for queued writes
> >   | * c91440c89fbd9d fuse: support large folios for stores
> >   | * cacc0645bcad3e fuse: support large folios for symlinks
> >   | * 351a24eb48209b fuse: support large folios for folio reads
> >   | * d60a6015e1a284 fuse: support large folios for writethrough writes
> >   | * 63c69ad3d18a80 fuse: refactor fuse_fill_write_pages()
> >   | * 3568a956932621 fuse: support large folios for retrieves
> >   | * 394244b24fdd09 fuse: support copying large folios
> >   | * f09222980d7751 fs: fuse: add dev id to /dev/fuse fdinfo
> >   | * 18ee43c398af0b docs: filesystems: add fuse-passthrough.rst
> >   | * 767c4b82715ad3 MAINTAINERS: update filter of FUSE documentation
> >   | * 69efbff69f89c9 fuse: fix race between concurrent setattrs from mu=
ltiple nodes
> >   | * 0c58a97f919c24 fuse: remove tmp folio for writebacks and internal=
 rb tree              <-- first bad commit
> >   | * 0c4f8ed498cea1 mm: skip folio reclaim in legacy memcg contexts fo=
r deadlockable mappings
> >   | * 4fea593e625cd5 fuse: optimize over-io-uring request expiration ch=
eck
> >   | * 03a3617f92c2a7 fuse: use boolean bit-fields in struct fuse_copy_s=
tate
> >   | * a5c4983bb90759 fuse: Convert 'write' to a bit-field in struct fus=
e_copy_state
> >   | * 2396356a945bb0 fuse: add more control over cache invalidation beh=
aviour
> >   | * faa794dd2e17e7 fuse: Move prefaulting out of hot write path
> >   | * 0486b1832dc386 fuse: change 'unsigned' to 'unsigned int'
> >   *   0fb34422b5c223 Merge tag 'vfs-6.16-rc1.netfs' of git://git.kernel=
.org/pub/scm/linux/kernel/git/vfs/vfs   <-- good
> >
> > The first and last commits shown are merge commits done by Linus Torval=
ds. The
> > fuse-update branch was based on v6.15-rc1, under which I can't run my t=
est due
> > to an unrelated bug, so I ended up merging in 0fb34422b5c223 to test th=
e
> > commits within the fuse-update branch. e.g.:
> >
> >   git reset --hard 394244b24fdd09 && git merge 0fb34422b5c223 && make c=
lean && make
> >
> >
> > I have also verified that the issue still happens on v6.18-rc7 but I wa=
sn't
> > able to revert 0c58a97f919 on top of this release, because a trivial re=
vert
> > is not possible.
> >
> > My test case consists of a few parts:
> >
> >  - A podman container based on the "debian:13" image (which points to
> >    docker.io/library/debian via /etc/containers/registries.conf.d/short=
names.conf),
> >    where I installed x2goserver and a openjdk-21-based application; It =
runs the
> >    OpenSSH server and port 22 is exposed as localhost:2001
> >  - x2goclient to start a desktop session in the container
> >
> > Source code: https://codeberg.org/neuschaefer/re-workspace
> >
> > I suspect, but haven't verified, that the X server in the container som=
ehow
> > uses the FUSE-emulated filesystem in the container to create a file tha=
t is
> > used with mmap (perhaps to create shared pages as frame buffers).
> >
> >
> > Raw bisect notes:
> >
> > good:
> > - v6.12.48+deb13-amd64
> > - v6.12.59
> > - v6.12
> > - v6.14
> > - v6.15-1304-g14418ddcc2c205
> > - v6.15-10380-gec71f661a572
> > - v6.15-10888-gb509c16e1d7cba
> > - v6.15-rc7-357-g8e86e73626527e
> > - v6.15-10933-g4c3b7df7844340
> > - v6.15-10954-gd00a83477e7a8f
> > - v6.15-rc7-366-g438e22801b1958 (CONFIG_X86_5LEVEL=3Dy)
> > - v6.15-rc4-126-g07212d16adc7a0
> > - v6.15-10958-gdf7b9b4f6bfeb1    <-- first parent, 5LEVEL doesn't exist
> > - v6.15-rc4-00127-g4d62121ce9b5
> > - v6.15-rc7-375-g61374cc145f4a5  <-- second parent, `X86_5LEVEL=3Dy`
> > - v6.15-rc7-375-g61374cc145f4a5  <-- second parent, `X86_5LEVEL=3Dn`
> > - v6.15-11061-g7f9039c524a351: "first bad", actually good. merge of df7=
b9b4f6bfeb1 61374cc145f4a5
> > - v6.15-11093-g0fb34422b5c223
> > - v6.15-rc1-7-g0c4f8ed498cea1 + merge =3D v6.15-11101-gaec20ffad33068
> >
> > testing:
> > - v6.18-rc7 + revert: doesn't apply
> >
> > weird (ssh doesn't work):
> > - v6.15-rc1-1-g0486b1832dc386
> > - v6.15-rc1-10-g767c4b82715ad3
> > - v6.15-rc1-13-g394244b24fdd09: folio stuff
> > - v6.15-rc1-22-gf3cb8bd908c72e
> > - v6.15-rc1-23-gc31f91c6af96a5
> > - next-20251128
> >
> > bad:
> > - v6.15-rc1-8-g0c58a97f919c24 + merge =3D v6.15-11102-gdfc4869c8ef1f0  =
first bad commit
> > - v6.15-rc1-9-g69efbff69f89c9 + merge =3D v6.15-11103-ga7b103c57680ce
> > - v6.15-rc1-11-g18ee43c398af0b + merge =3D v6.15-11105-g4ad0d4fa61974c
> > - v6.15-rc1-13-g394244b24fdd09 + merge =3D v6.15-11107-g37da056b3b873b
> > - v6.15-11119-g2619a6d413f4c3: merge of 0fb34422b5c223 (last good) dabb=
9039102879 (fuse branch)
> > - v6.15-11165-gfd1f8473503e5b: confirmed bad
> > - v6.15-11401-g69352bd52b2667
> > - v6.15-12422-g2c7e4a2663a1ab
> > - regulator-fix-v6.16-rc2-372-g5c00eca95a9a20
> > - v6.16.12
> > - v6.16.12 again
> > - v6.16.12+deb14+1-amd64
> > - v6.18-rc7
>
> Would that ring some bells to you which make this tackable?

Hi Salvatore,

This looks like the same issue reported in this thread [1]. The lockup
occurs when there's a faulty fuse server on the system that doesn't
complete a write request. Prior to commit 0c58a97f919c24 ("fuse:
remove tmp folio for writebacks and internal rb tree"), syncs on fuse
filesystems were effectively no-ops. This patch upstream [2] reverts
the behavior back to that. I'll send v2 of that patch and work on
getting it merged as soon as possible.

Thanks,
Joanne

[1] https://lore.kernel.org/regressions/mwBOip3XK77dn-UJtlk-uQ1N6i3nwsKticZ=
yQdPYzQcsk0dsjXl4oOAh-Neoxv-0TlpKnt_FEJwx8ses5VJglGLJUW-bIG8KWchtoDwCnnA=3D=
@protonmail.com/#t

[2] https://lore.kernel.org/linux-mm/20251120184211.2379439-1-joannelkoong@=
gmail.com/

>
> Regards,
> Salvatore
