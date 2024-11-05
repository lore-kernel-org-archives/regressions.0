Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E501DD0D0
	for <regressions@lists.linux.dev>; Tue,  5 Nov 2024 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730834645; cv=none; b=Be3yB4HYczn5cvzaOtWqXcbgs6gwizbDgRjiu9LuX99FWo/y9v7QZLTGa+28A/9gfkhgiHMJ4hBtQEbiDT7q/y73uLrh+j+1RYr3zMFI74yJAVP7oLfj9Ps0PtzPcepX0Qrt6IUEOvyaSZ7ICKERpMLq+ssYVYpJNOQsgMsW9uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730834645; c=relaxed/simple;
	bh=g+2efGR3dbdcPr1Nw5UNBnPimF0qmnyHzg9hIT10bfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdIpw6oHG6HTVEn8H8ZV6xoQzYBTwAfzSO1ytlQgSe6COIqQwMrfBhO/DNzsLUjZ/VX3qaOZnNHcVc8pMmM+xnU94I2oMfl/DSFAuAOzhu/Ihx4g7CZUgZphlImCf09HCDzX998XMB4qM3NFzRFWSupkBUIKmOSDlZVq/knjWlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EczUwkDs; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EczUwkDs"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9e8522c10bso20324166b.1
        for <regressions@lists.linux.dev>; Tue, 05 Nov 2024 11:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730834642; x=1731439442; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CSZJcZhNNgaAJYyZ3UhxJyhh0uxdQZk+eTwkMHAe5g8=;
        b=EczUwkDsEEy/C3HKrgTUZrowHf5UuhK3c1DdVofJPGqR7p4L/jqcURQ1P3R9AZDBf6
         YXM+rtP7LbWiE1S23scxlzH6KwDSilmPKllLfgkJGjCWRWbiBV6n6/wdqN3ZYsxSRw9n
         lZHJ+y6j++cUsuXt92oNwQIzrA9z4oNJWA2ML7K9LGgVF7355ArA8GtEGqgIVhAvgMNi
         nEbRqBjzqE/goXBdqUkwSrLjyIn2+QHzoS0KAap65scVDi6tustxqa/w6hqPLVSguVn2
         ICAUMbRkz0tzb2Ss+b62PmqlglQxfHzvjT61Oz22ECWrF5Q0DOPzVkFX8IhGSxXuUlGr
         jZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730834642; x=1731439442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CSZJcZhNNgaAJYyZ3UhxJyhh0uxdQZk+eTwkMHAe5g8=;
        b=P1ON6AFNG6t3580Cb41eXodEVvEYw6pvu5abPRTjLZAvYxZsbfARyoH3VHwZr6euHR
         jk21aKtwzKylS4B8yn+d/6XoAhwJJFvNeiPNcp8Lz2G99ecJKiE7gB8KR55GFArHfVWi
         C5Mqf81TQgPzVWytTvt48fO4NFM/SMCje6qXl6b40DBWbmQiCVFSMG6nXLI5OvDaim2y
         ZjMJAQzioj7MNN3CX9RuwSUL030ukP60KOtiQaURiUwFDW7jV4WNW8KDUqFKl7ugmtzY
         6TWX1eYKz46buD7lZNUVgfJNd42S+j7uel4lPHu/esDdm2zcQXHSxgYBZn1wPApqDfBY
         4xBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGep+S5brzk1va37QlPk3THQsJo3eluMbSN5oXbYwU1wTnLpS/1RJSQXHtGOYcHkJU3yya5UNJnqFT+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5pOE0swdKSs8sBrz90vUgQZJ3RuM5PJ9xgCEKRddJ93dsC00/
	C0+mEBKL4N4otz9YDH0At+xZvIz9fZZo9XjBq2+ycD9bXc9A/+cFM54Ubc0i
X-Google-Smtp-Source: AGHT+IFqmxGKbX+wPZMvD7DNqJ/lCN4Fe1cK8sPG0leKEKeUroKvuDOSZ/LS2QoVoCTnXi7430au1g==
X-Received: by 2002:a17:907:9446:b0:a99:f209:cea3 with SMTP id a640c23a62f3a-a9e55a4f2b9mr1920250966b.11.1730834642033;
        Tue, 05 Nov 2024 11:24:02 -0800 (PST)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch. [82.192.242.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16aecbasm173841666b.32.2024.11.05.11.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 11:24:00 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id D0506BE2DE0; Tue, 05 Nov 2024 20:23:59 +0100 (CET)
Date: Tue, 5 Nov 2024 20:23:59 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Mike <user.service2016@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Sasha Levin <sashal@kernel.org>,
	Jeremy =?iso-8859-1?Q?Lain=E9?= <jeremy.laine@m4x.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Bluetooth kernel BUG with Intel AX211 (regression in 6.1.83)
Message-ID: <Zypwz65wRM-FMXte@eldamar.lan>
References: <30f4b18f-4b96-403c-a0ab-d81809d9888a@gmail.com>
 <c09d4f5b-0c4b-4f57-8955-28a963cc7e16@leemhuis.info>
 <2024061258-boxy-plaster-7219@gregkh>
 <d5aa11c9-6326-4096-9c29-d9f0d11f83b4@leemhuis.info>
 <ZyMkvAkZXuoTHFtd@eldamar.lan>
 <ab5e25d8-3381-452e-ad13-5d65c0e12306@leemhuis.info>
 <CABBYNZKQAJGzA8th8A7Foiy7YaSFZDpLvLZqDFsVJ3Yzn8C_5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABBYNZKQAJGzA8th8A7Foiy7YaSFZDpLvLZqDFsVJ3Yzn8C_5g@mail.gmail.com>

Hi Luiz,

On Tue, Nov 05, 2024 at 12:53:50PM -0500, Luiz Augusto von Dentz wrote:
> Hi,
> 
> On Tue, Nov 5, 2024 at 12:29 PM Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
> >
> > On 31.10.24 07:33, Salvatore Bonaccorso wrote:
> > > On Tue, Jun 18, 2024 at 12:30:18PM +0200, Thorsten Leemhuis wrote:
> > >> On 12.06.24 14:04, Greg KH wrote:
> > >>> On Thu, Jun 06, 2024 at 12:18:18PM +0200, Thorsten Leemhuis wrote:
> > >>>> On 03.06.24 22:03, Mike wrote:
> > >>>>> On 29.05.24 11:06, Thorsten Leemhuis wrote:
> > >>>>> [...]
> > >>>>> I understand that 6.9-rc5[1] worked fine, but I guess it will take some
> > >>>>> time to be
> > >>>>> included in Debian stable, so having a patch for 6.1.x will be much
> > >>>>> appreciated.
> > >>>>> I do not have the time to follow the vanilla (latest) release as is
> > >>>>> likely the case for
> > >>>>> many other Linux users.
> > >>>>>
> > >>>> Still no reaction from the bluetooth developers. Guess they are busy
> > >>>> and/or do not care about 6.1.y. In that case:
> > >>>>
> > >>>> @Greg: do you might have an idea how the 6.1.y commit a13f316e90fdb1
> > >>>> ("Bluetooth: hci_conn: Consolidate code for aborting connections") might
> > >>>> cause this or if it's missing some per-requisite? If not I wonder if
> > >>>> reverting that patch from 6.1.y might be the best move to resolve this
> > >>>> regression. Mike earlier in
> > >>>> https://lore.kernel.org/all/c947e600-e126-43ea-9530-0389206bef5e@gmail.com/
> > >>>> confirmed that this fixed the problem in tests. Jeremy (who started the
> > >>>> thread and afaics has the same problem) did not reply.
> > >>>
> > >>> How was this reverted?  I get a bunch of conflicts as this commit was
> > >>> added as a dependency of a patch later in the series.
> > >>>
> > >>> So if this wants to be reverted from 6.1.y, can someone send me the
> > >>> revert that has been tested to work?
> > >>
> > >> Mike, can you help out here, as you apparently managed a revert earlier?
> > >> Without you or someone else submitting a revert I fear this won't be
> > >> resolved...
> > >
> > > Trying to reboostrap this, as people running 6.1.112 based kernel
> > > seems still hitting the issue, but have not asked yet if it happens as
> > > well for 6.114.
> > >
> > > https://bugs.debian.org/1086447
> > >
> > > Mike, since I guess you are still as well affected as well, does the
> > > issue trigger on 6.1.114 for you and does reverting changes from
> > > a13f316e90fdb1 still fix the issue? Can you send your
> > > backport/changes?
> >
> > Hmmm, no reply. Is there maybe someone in that bug that could create and
> > test a new revert to finally get this resolved upstream? Seem we
> > otherwise are kinda stuck here.
> 
> Looks like we didn't tag things like 5af1f84ed13a ("Bluetooth:
> hci_sync: Fix UAF on hci_abort_conn_sync") and a239110ee8e0
> ("Bluetooth: hci_sync: always check if connection is alive before
> deleting") that are actually fixes to a13f316e90fdb1.

Ah good I see :). None of those were yet applied to the 6.1.y series
were the issue is still presend. Would you be up to provide the needed
changes to the stable team?  That would be very much appreciated for
those affected running the 6.1.y series. 

Thanks a lot for pointing out the fixes!

Regards,
Salvatore
