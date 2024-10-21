Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A751FA251
	for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 18:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729535861; cv=none; b=Kbwv4C9GN8iOHmoQJf2nujIsqHzWXutPgOBSvO/ZJ6ggOxs3YJMzmHM3bMwBzSaP0KsXvkRVar3vq5ELXd7USI+4RKwucXZC2cLIGqZ3kqs9zTYyqU0wr7VdqExrQaoTCKIRUbhMua8jL3F5/Om2Ry4ZKPnsyz4dxS99+mb7Pp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729535861; c=relaxed/simple;
	bh=0SUJbgNx3eOZjTuV6Q+hk8RNMx0xF/hitFW2WzpO/QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbKxvfSOGb50yQmTq89hc91oQ5fIxjoGkpm3nOFPMIZKlsVuWSgzWSd3ArKLBxwrrEwDopv5/E794/JkF33U1NHxgYCRoWjrCpGLeVj8/4o7zmKI3Nwew7svOa8XfEfeYnBeR7YUWuN9aPs/iRFfXfNGgYmgPhpJI976s9I+XFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Ti9dlO01; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Ti9dlO01"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7c3d8105646so413437a12.2
        for <regressions@lists.linux.dev>; Mon, 21 Oct 2024 11:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1729535859; x=1730140659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5j7icT9lIHVPtU00aeMbuiyKH7bafqrPCA+BLUMEwc=;
        b=Ti9dlO01DUDQqYimAoOw7YRMIm7HEuoh6UnahZUXvddjYhiw5IiqHMJVLjJ+BpoViN
         v+PSTBwNCoVKTYl+e44WfyIkDoEnarQP8Hu7pzThflOV8qw8h1wjcEw7SK+c+/e1oscP
         fmiGcbFoTmVVeJl7IvMvCMuEjgU9pxNL4SoLNWUtf51kCl08O4aWE2NfEcjx89C86TSQ
         bw4SizgaaLEWW1Zngtfy6VW5cM4uMT/RUNyqIRwgozkTpT0LLAQX72K9mLpCnXtMChwL
         Ig4qnX2flteIjN7ijL5FuYTTHxsk1VSiQg7sbs3Chj5pjbr9yO+f1+DqmNxIEgEC3Q6A
         W8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535859; x=1730140659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5j7icT9lIHVPtU00aeMbuiyKH7bafqrPCA+BLUMEwc=;
        b=WgRAxJc0zvv1swdeQLxJM2HCMUa5WBEHdJ21DA0PgBJ3qvrsS7T9+QQPO2IsRxGGrk
         uNdoIACNc2JZhEBy0L8YFMNlNtVCMUJeNKk52ZWlJX4UUBNLxtaKI1X9fGCKBesIcNgG
         NgBFEbF1vPKShkBFbMlyIEZPqf5sA8hsb59qMQShRE0/ODNa8YM44kDr92pxTv9X62/h
         5atDXomPbHN/7Wg79KUcAWvDdadKWa9A4mhEBqVGOMfTQE9JYFk/KnbIlsqic4Z1UW+b
         uJ/OmtJXRidmND73baB6WAbG6AZ7NOG3P5LmYaD3DZQmVzhZWL6F4iFQdKu3pNsR6UfB
         dYBw==
X-Forwarded-Encrypted: i=1; AJvYcCUH3UpoTuQ4dCIX8uf+jRTQQcS8R9thCASWHLYrdIPqci+hQCr9MCbw6fNxLoP/JSLVHlEq17kPGsQMCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgBnBYcaUobVBVMJhd9UU5ZSWGOOCzxKHJPEWAt5NZ9MFqt35W
	cDfPER60lq5POu7b2ZrnIFR/gHK8o4c+Quu5yj7e7vR35dkDUiSOb5cRohxzLSU=
X-Google-Smtp-Source: AGHT+IGjVrxGI7vRL1cAMgODrOkEYyCHDy3yO1o/KuWMm50o0RkBzBKcFhb0FV8VK6oPEWUdUVd6vg==
X-Received: by 2002:a05:6a20:7484:b0:1cf:2be2:5e5a with SMTP id adf61e73a8af0-1d92c595d40mr8134257637.10.1729535859094;
        Mon, 21 Oct 2024 11:37:39 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::7:4942])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13fe316sm3200983b3a.184.2024.10.21.11.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 11:37:38 -0700 (PDT)
Date: Mon, 21 Oct 2024 11:37:36 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Dominique Martinet <asmadeus@codewreck.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>,
	Pedro Falcato <pedro.falcato@gmail.com>
Subject: Re: [PATCH] 9p: Avoid creating multiple slab caches with the same
 name
Message-ID: <ZxafcO8KWMlXaeWE@telecaster.dhcp.thefacebook.com>
References: <20240807094725.2193423-1-pedro.falcato@gmail.com>
 <20241018172804.GA2151929@nvidia.com>
 <CAKbZUD0Z_Kyumx3ourywUYhfksGNgJWrCpjAdnxtsbwS4vMRkA@mail.gmail.com>
 <1cb07628-269c-4d6c-9936-f3a2b233165f@leemhuis.info>
 <b6852c2d-3371-47a4-bfeb-049f4048e88a@suse.cz>
 <ZxL3FsmjGrTT_EV9@codewreck.org>
 <d937fd92-249e-4660-a59a-ee85b6ec4691@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d937fd92-249e-4660-a59a-ee85b6ec4691@suse.cz>

On Mon, Oct 21, 2024 at 10:42:02AM +0200, Vlastimil Babka wrote:
> On 10/19/24 02:02, Dominique Martinet wrote:
> > Vlastimil Babka wrote on Fri, Oct 18, 2024 at 11:38:04PM +0200:
> >> > In that case: Linus, given the circumstances I wonder if it would be
> >> > best if you could merge the patch at the start of this thread
> >> > (https://lore.kernel.org/all/20240807094725.2193423-1-pedro.falcato@gmail.com/
> >> > ) directly, which can also be found as 79efebae4afc22 in -next if you
> >> > prefer to cherry-pick it from there  Either now or after 24 to 36 hours,
> >> > which would give Eric a chance to ACK/NACK this if he sees this mail.
> > 
> > Sorry to everyone involved, I've just sent the merge request - I wasn't
> > much at computer in the past few weeks so wanted to wait until I got
> > back home to send it just in case, as I didn't realize this was a recent
> > regression that caused actual harm (it sounded like an old warning that
> > someone just recently happened to hit, and sounded easy enough to work
> > around locally if there is only one specific setup involved); I should
> > have sent the fix separately or at least corrected myself about the
> > schedule.
> > 
> >> >>> It is causing regressions in my environment
> >> >>> #regzbot introduced: 4c39529663b9
> >> > 
> >> > If anyone wonders, that is 4c39529663b931 ("slab: Warn on duplicate
> >> > cache names when DEBUG_VM=y") [v6.12-rc1]. That's also why I'm CCing
> >> > Vlastimil, so he knows about this.
> > 
> > (that might have been nice to have as a Fixes tag for eventual backport,
> > but at least that commit doesn't appear to have been picked up by stable
> > so it's probably fine as is)
> 
> Yeah it's missing the tag because I believe Pedro sent the 9p fix before
> sending the new warning patch itself, so there was even no commit ID yet.
> The plan was to introduce the warning only after all pre-existing in-tree
> code that would triggers it was fixed. I just assumed the fix would be
> mainlined before/at the same time as the warning itself, but forgot to
> check. In any case if I see e.g. autosel picking the warning patch for
> stable, I'll object.
> 
> Thanks,
> Vlastimil

FYI, drgn's CI started getting EIO errors from
getdents("/sys/kernel/slab") that I bisected to this patch. The problem
is that dev_name can be an arbitrary string. In my case, it is
"/dev/root". This trips verify_dirent_name(), which fails if a filename
contains a slash.

This needs to use a different unique identifier. Maybe clnt->msize? But
then the kmem_caches will need to be shared between different mounts
using the same msize.

In any case, can this be reverted for now?

Thanks,
Omar
