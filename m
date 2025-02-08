Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB59E154C0D
	for <regressions@lists.linux.dev>; Sat,  8 Feb 2025 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029622; cv=none; b=WEmrbg5e256yaZnynLih2YlEic8zFKMXKc2b3YiFZ9B39HbfDcfkItrDR6nAENmZvS33uHbGELx2M/1iRBpTUuVEvZdhuU/EVT/XwVlwxg1pyrlCGGweI20mhP3cC0IC2OkJ3z+KlisIkm2h6Jza4Ry0cuAlLjhhzhz9hlHrPZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029622; c=relaxed/simple;
	bh=5oF7U/lMdQNsEhvFQBmWFeeAK8Ia/CG64J+TV4m7MlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dAnF/mSBQ8MlthbJ/+MjjxBWJPEKPlgmvyZW9Amdiadnur3QOjQHhsecu62ixNfJahyRe9fc4en/S/V2Md3zaM925nP+5uZWP8+v4axLAByuRakZTEU1mBbJm4tDi/lE9elGu6xi/KrmsngQlHyUrF3u4099MWheVit3ZgOlb40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hl5xw4YU; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hl5xw4YU"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4679eacf25cso17549271cf.3
        for <regressions@lists.linux.dev>; Sat, 08 Feb 2025 07:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739029620; x=1739634420; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fOnrK9Ez1FxS3AJL66DzUp4872IstaGG4vVRCtFBhM=;
        b=hl5xw4YUZfUHNou7yzzQ3Fhw/mIrzibAHTvvy/DDR6VrfXWqVgX9IXJEd4X067M4f9
         bV/QMmntDfl7PkrVQwaVEel1IRUHvlv1uF0ZDYuoHiu2kGpn8EkBB0vB+1szdeckYvli
         EsU4GhAPa2+JIAMG+w5m2lHy/rLGI2pVUy/VXdE/m8pOu7RAEIBFcuBZjmFN8HTtjvTK
         VeDDpv4ee1m12v0iroG8IQv/XvWpd3WjzQXOYMT6XsSKZ67T/UJP6UOoiekQdAXN5uFv
         E8DdBpaLW8/sdgCSHQ9pj4OXgq0Vdn+91qSjopUZX/caM4J/UN0Zb1keduS+asIlPAa9
         CBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739029620; x=1739634420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fOnrK9Ez1FxS3AJL66DzUp4872IstaGG4vVRCtFBhM=;
        b=VtKCfMipqLVkNiYTwm8TfGGpa91V8PY8Jp1EVnWELB4YxW6ZVPho614UgVwn0qJQn/
         BgIvULf5JOoNUfqk/jkCsF0dzsUBD2fRPlwzBLjfz0Dp9P2h0Y6n5p9/OPORmb0hlnA6
         +tK/NsXt4jcDOM5Lxtzxtvv+4A4vsi1oL1Evj3mFjOgMAz9jVbNkJaoIMELJXobLyfYD
         lw87u1T+2Kz/rx0ds482JeBKgRbp+YrDNPJVpag5chqVLoEMjXQ6vN2XfyR1Wpe2e6FM
         lr7cMsIbnFXBAasa/5OLxTYD11jRcr1OrZe5yXscMabqvzr1SvP613EhUYHwQwzLfReZ
         iXDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUO3Azn3hvhE29YBbgrJEyP7rvek8etTucOhjGqZsDjPQpSuXxiYNJkK5CPhT1CWXlAiHCe3y8Lcda+w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQETyNr/mmwhcjeC81n/Fa6OCIJiJUov63ZPR2MJSAZnCQzxbb
	pFKit/QazlCsDszFEA/1m3oZgZzwgqC5k8f+37xy94kSrrERRptZuJvtDbH+ciMQv2KRUSE5fzm
	LYsT8KIcn1G4jlA7jwehVHmGtrTw=
X-Gm-Gg: ASbGnctHZO/V2fiaMA6S31t1tmp7egPOPg5zliTiTFFpQMBg7wTP+WErRZo0ogUuhYN
	Jakp65UMBjf9+0SYQtodZvGcVWJTRzzo+cbJlNMO9KPvfxxNgRgIY9mFhIapdGAVn90nPR34y5Q
	==
X-Google-Smtp-Source: AGHT+IFSh4Mb6rl+oRG62Z0H13C2MR3PfJXfuPqUV/E9DdliMmk9tvl6Kyi3LNNOMS6rezVnMSgNza0FH6hi6ihzvh0=
X-Received: by 2002:a05:622a:107:b0:467:706f:14b7 with SMTP id
 d75a77b69052e-47167a5327dmr98645921cf.30.1739029619751; Sat, 08 Feb 2025
 07:46:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2f681f48-00f5-4e09-8431-2b3dbfaa881e@heusel.eu>
 <CAJfpegtaTET+R7Tc1MozTQWmYfgsRp6Bzc=HKonO=Uq1h6Nzgw@mail.gmail.com>
 <9cd88643-daa8-4379-be0a-bd31de277658@suse.cz> <20250207172917.GA2072771@perftesting>
 <8f7333f2-1ba9-4df4-bc54-44fd768b3d5b@suse.cz> <CAJnrk1aNVMCfTjL0vo-Qki68-5t1W+6-bJHg+x67kHEo_-q0Eg@mail.gmail.com>
 <Z6ct4bEdeZwmksxS@casper.infradead.org>
In-Reply-To: <Z6ct4bEdeZwmksxS@casper.infradead.org>
From: Joanne Koong <joannelkoong@gmail.com>
Date: Sat, 8 Feb 2025 07:46:48 -0800
X-Gm-Features: AWEUYZlmX7UqjYolQF--Dd82_LLes-B_HkoK5EPAEx4gxpTBKL3nR7nmvwna1lU
Message-ID: <CAJnrk1aY0ZFcS4JvmJL=icigencsCD8g4qmZiTuoPWj2S2Y_LQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Crash with Bad page state for FUSE/Flatpak
 related applications since v6.13
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Josef Bacik <josef@toxicpanda.com>, 
	Miklos Szeredi <miklos@szeredi.hu>, Christian Heusel <christian@heusel.eu>, 
	Miklos Szeredi <mszeredi@redhat.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm <linux-mm@kvack.org>, =?UTF-8?Q?Mantas_Mikul=C4=97nas?= <grawity@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 2:11=E2=80=AFAM Matthew Wilcox <willy@infradead.org>=
 wrote:
>
> On Fri, Feb 07, 2025 at 04:22:56PM -0800, Joanne Koong wrote:
> > > Thanks, Josef. I guess we can at least try to confirm we're on the ri=
ght track.
> > > Can anyone affected see if this (only compile tested) patch fixes the=
 issue?
> > > Created on top of 6.13.1.
> >
> > This fixes the crash for me on 6.14.0-rc1. I ran the repro using
> > Mantas's instructions for Obfuscate. I was able to trigger the crash
> > on a clean build and then with this patch, I'm not seeing the crash
> > anymore.
>
> Since this patch fixes the bug, we're looking for one call to folio_put()
> too many.  Is it possibly in fuse_try_move_page()?  In particular, this
> one:
>
>         /* Drop ref for ap->pages[] array */
>         folio_put(oldfolio);
>
> I don't know fuse very well.  Maybe this isn't it.

Yeah, this looks it to me. We don't grab a folio reference for the
ap->pages[] array for readahead and it tracks with Mantas's
fuse_dev_splice_write() dmesg. this patch fixed the crash for me when
I tested it yesterday:

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index 7d92a5479998..172cab8e2caf 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -955,8 +955,10 @@ static void fuse_readpages_end(struct fuse_mount
*fm, struct fuse_args *args,
                fuse_invalidate_atime(inode);
        }

-       for (i =3D 0; i < ap->num_folios; i++)
+       for (i =3D 0; i < ap->num_folios; i++) {
                folio_end_read(ap->folios[i], !err);
+               folio_put(ap->folios[i]);
+       }
        if (ia->ff)
                fuse_file_put(ia->ff, false);

@@ -1049,6 +1051,7 @@ static void fuse_readahead(struct readahead_control *=
rac)

                while (ap->num_folios < cur_pages) {
                        folio =3D readahead_folio(rac);
+                       folio_get(folio);
                        ap->folios[ap->num_folios] =3D folio;
                        ap->descs[ap->num_folios].length =3D folio_size(fol=
io);
                        ap->num_folios++;


I reran it just now with a printk by that ref drop in
fuse_try_move_page() and I'm indeed seeing that path get hit.

Not sure why fstests didn't pick this up though since splice is
enabled by default in passthrough_hp, i'll look into this next week.
