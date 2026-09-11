Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028453F107E
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 18:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152632; cv=pass; b=e8i8pIG8vauIUxNJ9MPlYFcehUxy+9hwU2W0UoNnrJWDpK/wpqpPDjXQpNJwe0RDV/EhtXlolRPgBbZORTIz6D3MNWnz5r+wKfovW8Dl7qOVllI4YG/1QiWTxH6lPSKtaNdJne1evu+vYh6tgufdBk1k8fHJQlTFWSc8VFIU4PM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152632; c=relaxed/simple;
	bh=3KvOhxNm0CE5YxCoN9gJrLaYGWlZurxjm2gpi9Iw+PA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUD4/8FbNkJeOcluBW+zOK74yNyq/BGS6jDfL9pCrvxxiYNVexo4uOe4s76Or1Wez6NyWR99T8p27LI1cVZkJ04q+yHEfuyjNA3JCHxQm4I7JBhKvqD3TftKyXqHu1FhHPZ/C7LNg2ooCEubc4sbEA991EbgvB9vEAjwLdC4aTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg0HiYA8; arc=pass smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg0HiYA8"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a6c77d255so105026137.2
        for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 11:50:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789152630; cv=none;
        d=google.com; s=arc-20260327;
        b=mh+XqMuwPiS5IFYZx67NMA0ZCPtZs7wJojvBxQB3pBYdS47fXzmHegINMyGk82Cz9i
         cuC7WEmX4t2LEQKYdwihjO+FrdG4+vCLixBgkWOsr6cfcL2QrZPx8C9u1Bd3G/GCCJUE
         YmM7t/qPqQJB1vVIFqgcSmv5rbjSJsDbM223MV/YxZKWAHy8COIiq8NKC3ZdcXF3GT/l
         7XJSljtpX6iOz1llsX5wX6ZJQ8txKTwb7ywzM28MnqnuEidWV5EqkkVAdi7GuXueSYWR
         OwOlhaC76zly5NAVl4LkNGLZCzvCQIgXT38F3AEHljT0zOXFXxQX5sbs6EifT+101US4
         8YLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7Ebif+V/8GnwYOzbevbeoMta8WL2O5tmRjG7YpGVGM=;
        fh=Q4x5jT3x0fEos1yCt1oiTlHcFDiWCHGg5ORl3wmnrSY=;
        b=PxvxNTp2Lk1XbCXeVzVoaKl5JxLgP7uOGeCpF3/qvdVTg19ncuSH7gSx2e3KglVqR6
         l9dJb4ZgDOVDjpFf5qRPQjkNhRp5sVA2CmNlXB6usmMeR0eoB0mR/AR76HxpVI1iv4PJ
         ib3lDeCLJaqX2FPj/LjFcl0FAc+qk6JZpFJnunAK1AIyLsWFKO4FEFUuwwhVQuuKANpV
         dKk+gmI7AaGU9rSMFXDfNCBzKPwOZiY7A8Bmt35kQZwE1vTvkUxYp4L0EFrs/bh5RKUZ
         oZ28KIxMudqZnhypt2lzzbTkpFkLJD2BL7WI6xRIpAU+dEty4XJyIKxMhOYp6WMapzyS
         7fhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152630; x=1789757430; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k7Ebif+V/8GnwYOzbevbeoMta8WL2O5tmRjG7YpGVGM=;
        b=dg0HiYA8Tv6Bauwrty6+onzJkNnlcHPVH8YPb3SN50SlPNJJHPS7HLAJIl2lj9515U
         FUKGg+a7nNeJ0Qcsn/46QKuxVssOyyC1nwkKsJLdisjiv0yd4sB0WRnNr3iIoAVFlLEu
         mcD87MfzGMPVzpw3/hNBFq+Ca8tQLPHvPgnIj0375AvzBFJKdyvRjvhjhzA5bg5jFYnt
         UXMX5++BHQUHdkqsQvc/pHAPk5oGpX6IlcFSPeM8DPnb3gwlnExb9oJKl4IIeKIIi+x8
         JKmTJ8YRYFwvh56ZG9clvoGou2R5N3OHfdoE3scxbE1yeFnPfVKt3DQNWvnra+8jjMJ6
         Bn4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152630; x=1789757430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k7Ebif+V/8GnwYOzbevbeoMta8WL2O5tmRjG7YpGVGM=;
        b=MkPUIulD/EQ5LzPO5HvjvT7BhAxGBDwlEBCu0w8jXUiyuXo4vqVvEaqHg9yeMiTczR
         doK2VNcLp8nrKZwpx4kAoF3jd99jngypgk5YEAZ8xW+QVp7+2xjq+NGZWU56e9LPz2cV
         r5BUgxxm8/coA55o1Iqt5xj9nn2+hZujv2Aqz2JhOmAkRY7SM56lwSeqPR7bvQYXROUP
         wssXxWhXP1dKWeIjL9SxtHLRcd3rYYWpUWRpejTiGTX7ANLmA31ut3jYzwI6wMMQOOkp
         ZE49a6g7qowSI246sj89D4IqevEz4Qw5lSbKhu6+lqLLOT8SHw/TugcnqYbRWMfG6QD8
         mCzA==
X-Forwarded-Encrypted: i=1; AKwUvBwE3Cluazb0/N/LPkoFmCIlGvyz8YM38LUxL/2frD0mpoEJdakguVoj0GPIoo7R4jfdSYYt2QGeDRVTYg==@lists.linux.dev
X-Gm-Message-State: AFuF++kN002BWDbPfVSTmiRYaszz8t5rGYNm3Yf22fYnwQ1hlDqbAweE
	tID3aEYUMm7CCYPXhE8rvfzBuyHVTdaHTLR/CbAIHa5pchnXrCQbxQ2uI6cw33dgdUD4WWRdIUY
	fi3a48KcCcN8NkiTdo1jpMdVN/dSAXFw=
X-Gm-Gg: AYBFou22HFG0PzOkyWXndzCbBwEv9GVc0J1BUc/0IosygqFasnQqAq5kk0vhQRbWju2
	xEohz/Fc5lWnvtj7gMIuagTGabPVFWAm5Ij5UtMpAlmcmH8nEH32O5UfwKFS+0r+h6mJTDoovCV
	+fjQ34n39O//4IPJe08KlmtcHktisjmSmU+oclp+VyTXRHh9OYZsdEIxMphp0T3frmBgVDb1htW
	vlcLNbdGO2MSM2TuHUjHlXclkrtPFY8xS+b+CQDqXlJ+j77uD9ac76kwV/SzWDJlQalh2x4z2+I
	ld9MjusjJkYRRd2NSeEhqI052u6Al6DeToc8DIv8S6rSovUgjl2FPUz9zOIliKSrZ3WE4JyXigT
	j/o4dSEGR9DaThkekfk333ydSVJU2ljNz8SF66BBLMy6aXg==
X-Received: by 2002:a05:6102:330d:b0:783:f3bf:f9aa with SMTP id
 ada2fe7eead31-792ac9e510amr2037393137.8.1789152629798; Fri, 11 Sep 2026
 11:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKLYgeL7nrA4nXcewdv9Fqg_s=3GS=vmoypnEiZBKQ7rySZFuQ@mail.gmail.com>
 <20260909002506.GF9053@twin.jikos.cz> <6a5c2d41-b10b-44cb-969e-b4a56d002ceb@gmx.com>
 <4c5117f7-1ddd-4596-8917-da47379506fd@leemhuis.info> <20260911182125.GE54722@twin.jikos.cz>
In-Reply-To: <20260911182125.GE54722@twin.jikos.cz>
From: Alex Romosan <aromosan@gmail.com>
Date: Fri, 11 Sep 2026 20:50:18 +0200
X-Gm-Features: AcwNN1UW1FBEQBXsPkjPpE7JnH1VnJKY_2TIGIr7JWZ82tYw8hH3-PTdsGDmOLw
Message-ID: <CAKLYgeLAXC5qbNAWnS3KNCijuRT9mF_hz4e1fUexx+D-J5Bs4g@mail.gmail.com>
Subject: Re: commit 108cc873398932af589c295f78c348513b8d70d9 breaks
 update-grub on btrfs root filesystem
To: dsterba@suse.cz
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Qu Wenruo <quwenruo.btrfs@gmx.com>, 
	linux-kernel@vger.kernel.org, linux-btrfs <linux-btrfs@vger.kernel.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

i agree it's a regression. one question (and i am not very familiar
with the underlying principles), how do the other filesystems deal
with this? shouldn't the registering of devices be abstracted out
since i would assume every fs does it or is this something btrfs
specific?

On Fri, Sep 11, 2026 at 8:21=E2=80=AFPM David Sterba <dsterba@suse.cz> wrot=
e:
>
> On Thu, Sep 10, 2026 at 12:39:25PM +0200, Thorsten Leemhuis wrote:
> > On 9/9/26 03:13, Qu Wenruo wrote:
> > > =E5=9C=A8 2026/9/9 09:55, David Sterba =E5=86=99=E9=81=93:
> > >> On Tue, Sep 08, 2026 at 11:59:43PM +0200, Alex Romosan wrote:
> > >>>
> > >>> [...] Since version 7.3-rc1 i haven't been able to to a grub-update=
,
> > >>> instead i get this error:
> > >>>
> > >>> /usr/sbin/grub-probe: error: cannot find a device for / (is /dev
> > >>> mounted?).
> > >>>
> > >>> 7.2 is fine. a git-bisect identified commit
> > >>> 108cc873398932af589c295f78c348513b8d70d9 as being the culprit.
> > >>> reverting this commit from 7.3-rc2 allowed me to run grub-update
> > >>> again.
> > >>>
> > >>> this is not the first time i reported grub-update being broken on
> > >>> btrfs. i reported exactly the same problem on jan 8, 2024
> > >>> (https://lkml.iu.edu/hypermail/linux/kernel/2401.1/00596.html). may=
be
> > >>> the discussion that followed would help come up with a fix that wil=
l
> > >>> make everybody happy.
> > >>
> > >> I remember debugging that one, https://bugzilla.kernel.org/
> > >> show_bug.cgi?id=3D218353
> > >> Reverting 108cc8733989 ("btrfs: fix a lockdep caused by path resolut=
ion
> > >> during device scan") would bring back the lockdep warning and there =
is a
> > >> locking problem.
> > >>
> > >> The commit says it's fixing 2e8b6bc0ab41 ("btrfs: avoid unnecessary
> > >> device path update for the same device"), the difference is in lines
> > >>
> > >> (https://bugzilla.suse.com/show_bug.cgi?id=3D1230641)
> > >>
> > >> -       } else if (!device->name || strcmp(device->name->str, path))=
 {
> > >> +    } else if (!device->name || !is_same_device(device, path)) {
> > >>
> > >> Which gets changed to (by 108cc8733989):
> > >>
> > >> -       } else if (!device->name || !is_same_device(device, path)) {
> > >> +       } else if (!device->name || device->devt !=3D path_devt) {
> > >>
> > >> Each change is reaction to a bug, I don't see a clear fix which will
> > >> make it work in all cases.
> > >
> > > And I want to add that, the previous path based comparison is also
> > > problematic for namespaces/weird block device names.
> > >
> > > Although not common, it's definitely possible to map weird block file
> > > name into a namespace.
> > >
> > > Thus the path based comparison is not reliable in the first place, no=
 to
> > > mention the later lockdep problems.
> >
> > Well, but our #1 is "no regressions". And the recent change while fixin=
g
> > bugs clearly causes one, as Alex's report is afaics at least the third
> > about it; the two earlier ones can be found here:
> >
> > https://lore.kernel.org/linux-btrfs/dfbe1e27-dab8-4d55-8cf3-0b28eeac5df=
4@gmail.com/
> > https://lore.kernel.org/linux-btrfs/018a9738-1d4a-43a0-9352-a56d1e54136=
4@gmail.com/
> > Plus a repost of the latter here:
> > https://lore.kernel.org/linux-btrfs/dfbe1e27-dab8-4d55-8cf3-0b28eeac5df=
4@gmail.com/
>
> I'm going to treat this as a regression. And for the record Qu and me
> are in disagreement on that. My target is to make the systems boot again
> first, the fix may leave some problematic case (like mentioned, devices
> in namespaces), but that is probably a lesser problem.
