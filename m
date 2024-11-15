Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE5D1D63DA
	for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 17:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731693418; cv=none; b=gUDCEt0oOv6Fgzs7Pq/eAqUTq+2xBQSxM66d73EpRceslmajNAEl0+NqjnoRRdavHuTf+kFcF1+yzFTI4EcryrWZOhcqij+qHMQWiM4XyZw4pRFj3KE40tgHqpIDoTRfGySBf725nv2BHEj68t1i6LwgUS7uPuFl16HRAchi4iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731693418; c=relaxed/simple;
	bh=8G1eQwpfLzzrbWLE731gSlaI/3BoTdKQ9z7j3rLVNJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXEGOdM0S3sNlTJHAeS62Dz7P5Y9CRjgNCETvUxQ0LdK77IqIJ+AJv4shG6SkMok8nuBE//aWH4s2SwIR0IY8tdLuB0yKyS33XLLzTA62FtLFk8HNhFMco8Ql+kqL5jBGZjBSYAiiMBwdktDWbv2qkdS7bbF+SzyuIZUm3Yt+hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ft//5tZu; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ft//5tZu"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5cf8ef104a8so1424559a12.2
        for <regressions@lists.linux.dev>; Fri, 15 Nov 2024 09:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731693414; x=1732298214; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yszZ/13xovLyV8+6Bm3HMI1O+tb18eMjfobAQVjAREg=;
        b=Ft//5tZuNNcSFD7m959zx6K6LJaHMvyd6tDU/3RDHkvkOfznfYyuhFIEC3mN4B72Jp
         6fnV7GZk13DHTvTb/9VJSoaAPHsDDoGprjOEwQrvyei8OUW8F6k+D1qUF2y4VJwJQFau
         OHXP5waq14fINeeLYukCSi6oSes5CbICgOC+E6yUxHAU+HRDhJnWYbZR71rYKzd9wznP
         CWlSmy8GJ7mj4PhaOqFxs34dUuj0VUFwpsbE3pEQijokvpcat8p+IOzTfNHGMzEsYXOq
         Ei37P2jWiaIjhDOTYtgFKEzHim1DV7ma4KIMaEFa8oTL8y+vWN7AKLd8eC9rTQ5aZPI8
         AdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731693414; x=1732298214;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yszZ/13xovLyV8+6Bm3HMI1O+tb18eMjfobAQVjAREg=;
        b=YIeMXsHgzutLLRAgx38vEcJxqUZwoDwEVbGB39MNg37c6Nh0Q1u3t4Xo7uLxwp3gmx
         8y6StZrJi+x1HlcQUb38QA7I15yH73e2wKb28EXwKQd/cd/4E5pmZRfUQ7Z/Ohdco0pH
         LvQLa8iqytmtmpTshRZb0mISmbQPEZ5haE8nlxzo2RnL4vD3Q+ez3S86V1Xj3R3NN9bC
         8wPvl2nHwAXcVaYRpT5nQyCDB/bYsUQGz/7eww/d/zhbQhw0Rj3ICGenFsWeA62PiV54
         nKeJdFwa51NiED4j+QSjX0hq6ZuJuOHU1mLkH3nSaGcBmmqH7Z9pqd5jICAeTcBlEqAo
         QUEw==
X-Forwarded-Encrypted: i=1; AJvYcCVdAb5kr1qwySC0XGLNBgDGro3UdSEB/G2fisRr9K+sxG36IpsRCzTzP87ZdpV4jZvFx4BsWwWpUZMRgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwygmqHfSzRZqxIfHAfuDDxBvETkIc8F9KRTNT4+atzMDq3Ckxa
	UG4DBI/A0GN5p+AizIQoqBiuMZpK+oHfd8tGTWabaDyc6vMpWW4c
X-Google-Smtp-Source: AGHT+IEfFnEwON+HSzkjwOoBuLCF6zULusBXwx1m/nRkf/7DvatVsNMnOVXjMlCBXNRhwhP6OcMSug==
X-Received: by 2002:a05:6402:280d:b0:5cf:479a:d8a0 with SMTP id 4fb4d7f45d1cf-5cf8fd2faa8mr2727792a12.26.1731693414322;
        Fri, 15 Nov 2024 09:56:54 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cf9566be44sm538792a12.40.2024.11.15.09.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 09:56:53 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 227FABE2EE7; Fri, 15 Nov 2024 18:56:52 +0100 (CET)
Date: Fri, 15 Nov 2024 18:56:52 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mike <user.service2016@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Sasha Levin <sashal@kernel.org>,
	Jeremy =?iso-8859-1?Q?Lain=E9?= <jeremy.laine@m4x.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
Message-ID: <ZzeLZHFWYCT6C8VI@eldamar.lan>
References: <ab5e25d8-3381-452e-ad13-5d65c0e12306@leemhuis.info>
 <CABBYNZKQAJGzA8th8A7Foiy7YaSFZDpLvLZqDFsVJ3Yzn8C_5g@mail.gmail.com>
 <Zypwz65wRM-FMXte@eldamar.lan>
 <2024110652-blooming-deck-f0d9@gregkh>
 <Zysdc3wJy0jAYHzA@eldamar.lan>
 <CABBYNZKz_5bnBxrBC3SoaGc1MTXXYsgdOXB42B0x+2dcPRkJyw@mail.gmail.com>
 <2024110703-subsoil-jasmine-fcaa@gregkh>
 <4f8542be-5175-4cf1-9c39-1809a899601c@leemhuis.info>
 <2024111225-regulate-ruckus-1a46@gregkh>
 <2024111358-catching-unclog-31f3@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2024111358-catching-unclog-31f3@gregkh>

Hi Greg,

On Wed, Nov 13, 2024 at 04:10:23PM +0100, Greg KH wrote:
> On Tue, Nov 12, 2024 at 01:04:03PM +0100, Greg KH wrote:
> > On Tue, Nov 12, 2024 at 12:54:46PM +0100, Thorsten Leemhuis wrote:
> > > On 07.11.24 05:38, Greg KH wrote:
> > > > On Wed, Nov 06, 2024 at 10:02:40AM -0500, Luiz Augusto von Dentz wrote:
> > > >> On Wed, Nov 6, 2024 at 2:40 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
> > > >>> On Wed, Nov 06, 2024 at 08:26:05AM +0100, Greg KH wrote:
> > > >>>> On Tue, Nov 05, 2024 at 08:23:59PM +0100, Salvatore Bonaccorso wrote:
> > > >>>>> On Tue, Nov 05, 2024 at 12:53:50PM -0500, Luiz Augusto von Dentz wrote:
> > > >>>>>> On Tue, Nov 5, 2024 at 12:29 PM Thorsten Leemhuis
> > > >>>>>> <regressions@leemhuis.info> wrote:
> > > >>>>>>> On 31.10.24 07:33, Salvatore Bonaccorso wrote:
> > > >>>>>>>> On Tue, Jun 18, 2024 at 12:30:18PM +0200, Thorsten Leemhuis wrote:
> > > >>>>>>>>> On 12.06.24 14:04, Greg KH wrote:
> > > >>>>>>>>>> On Thu, Jun 06, 2024 at 12:18:18PM +0200, Thorsten Leemhuis wrote:
> > > >>>>>>>>>>> On 03.06.24 22:03, Mike wrote:
> > > >>>>>>>>>>>> On 29.05.24 11:06, Thorsten Leemhuis wrote:
> > > >>>>>>>>>>>> [...]
> > > >>>>>>>>>>>> I understand that 6.9-rc5[1] worked fine, but I guess it will take some
> > > >>>>>>>>>>>> time to be
> > > >>>>>>>>>>>> included in Debian stable, so having a patch for 6.1.x will be much
> > > >>>>>>>>>>>> appreciated.
> > > >>>>>>>>>>>> I do not have the time to follow the vanilla (latest) release as is
> > > >>>>>>>>>>>> likely the case for
> > > >>>>>>>>>>>> many other Linux users.
> > > >>>>>>>>>>>>
> > > >>>>>>>>>>> Still no reaction from the bluetooth developers. Guess they are busy
> > > >>>>>>>>>>> and/or do not care about 6.1.y. In that case:
> > > >>>>>>>>>>>
> > > >>>>>>>>>>> @Greg: do you might have an idea how the 6.1.y commit a13f316e90fdb1
> > > >>>>>>>>>>> ("Bluetooth: hci_conn: Consolidate code for aborting connections") might
> > > >>>>>>>>>>> cause this or if it's missing some per-requisite? If not I wonder if
> > > >>>>>>>>>>> reverting that patch from 6.1.y might be the best move to resolve this
> > > >>>>>>>>>>> regression. Mike earlier in
> > > >>>>>>>>>>> https://lore.kernel.org/all/c947e600-e126-43ea-9530-0389206bef5e@gmail.com/
> > > >>>>>>>>>>> confirmed that this fixed the problem in tests. Jeremy (who started the
> > > >>>>>>>>>>> thread and afaics has the same problem) did not reply.
> > > >>>>>>>>>>
> > > >>>>>>>>>> How was this reverted?  I get a bunch of conflicts as this commit was
> > > >>>>>>>>>> added as a dependency of a patch later in the series.
> > > >>>>>>>>>>
> > > >>>>>>>>>> So if this wants to be reverted from 6.1.y, can someone send me the
> > > >>>>>>>>>> revert that has been tested to work?
> > > >>>>>>>>>
> > > >>>>>>>>> Mike, can you help out here, as you apparently managed a revert earlier?
> > > >>>>>>>>> Without you or someone else submitting a revert I fear this won't be
> > > >>>>>>>>> resolved...
> > > >>>>>>>>
> > > >>>>>>>> Trying to reboostrap this, as people running 6.1.112 based kernel
> > > >>>>>>>> seems still hitting the issue, but have not asked yet if it happens as
> > > >>>>>>>> well for 6.114.
> > > >>>>>>>>
> > > >>>>>>>> https://bugs.debian.org/1086447
> > > >>>>>>>>
> > > >>>>>>>> Mike, since I guess you are still as well affected as well, does the
> > > >>>>>>>> issue trigger on 6.1.114 for you and does reverting changes from
> > > >>>>>>>> a13f316e90fdb1 still fix the issue? Can you send your
> > > >>>>>>>> backport/changes?
> > > >>>>>>>
> > > >>>>>>> Hmmm, no reply. Is there maybe someone in that bug that could create and
> > > >>>>>>> test a new revert to finally get this resolved upstream? Seem we
> > > >>>>>>> otherwise are kinda stuck here.
> > > >>>>>>
> > > >>>>>> Looks like we didn't tag things like 5af1f84ed13a ("Bluetooth:
> > > >>>>>> hci_sync: Fix UAF on hci_abort_conn_sync") and a239110ee8e0
> > > >>>>>> ("Bluetooth: hci_sync: always check if connection is alive before
> > > >>>>>> deleting") that are actually fixes to a13f316e90fdb1.
> > > >>>>>
> > > >>>>> Ah good I see :). None of those were yet applied to the 6.1.y series
> > > >>>>> were the issue is still presend. Would you be up to provide the needed
> > > >>>>> changes to the stable team?  That would be very much appreciated for
> > > >>>>> those affected running the 6.1.y series.
> > > >>>>
> > > >>>> We would need backports for these as they do not apply cleanly :(
> > > >>>
> > > >>> Looks our mails overlapped, yes came to the same conclusion as I tried
> > > >>> to apply them on top of 6.1.y. I hope Luiz can help here.
> > > >>>
> > > >>> We have defintively users in Debian affected by this, and two
> > > >>> confirmed that using a newer kernel which contains naturally those
> > > >>> fixes do not expose the problem. If we have backports I might be able
> > > >>> to convice those affected users to test our 6.1.115-1 + patches to
> > > >>> verify the issue is gone.
> > > >>
> > > >> Then perhaps it is easier to just revert that change?
> > > > 
> > > > Please send a revert then.
> > > 
> > > We afaics are kinda stuck here .
> > > 
> > > Seems Mike (who apparently had a local revert that worked) does not care
> > > anymore.
> > > 
> > > It looks like Luiz does not care about 6.1.y either, which is fine, as
> > > participation in stable is optional.
> > > 
> > > And looks like nobody else cares enough and has the skills to
> > > prepare and submit a revert.
> > > 
> > > In the end the one that asked for the changes to be included in the
> > > 6.1.y series thus submit one. Not sure who that is, though, a very quick
> > > search on Lore gave no answer. :-/
> > > 
> > > There is also still the question "might a revert now cause another
> > > regression for users of the 6.1.y series, as the change might improved
> > > things for other users".
> > > 
> > > :-(
> > 
> > I care as this affects Debian, which is the largest user of Linux
> > outside of Android.  I'll try to do a local version of the revert to
> > unstick this...
> 
> Ok, I have a series of reverts that seems to build properly for 6.1.y
> that I'll queue up after this round of stable releases goes out
> tomorrrow to hopefully resolve this.

Thanks. I have asked affected users which did report the issue in
Debian if they can test the reverts (hope to get feedback in time
before the actual 6.1.118 release).

Regards,
Salvatore
