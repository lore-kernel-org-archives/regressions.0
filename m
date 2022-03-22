Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341F67A
	for <regressions@lists.linux.dev>; Tue, 22 Mar 2022 07:12:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2D9C340EC;
	Tue, 22 Mar 2022 07:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1647933165;
	bh=yxwU7CsJOCNbdkgv4B/ZBXEicx3XwqOv3MwlaB6taR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzUxnCQQ+GbsBzK+1XSgGzkDKkZWeLRDbg5/QJ1pZW8r9bET5RhhEvUwztTwnbt7J
	 UaDFlEMo1PD6qt5qxsVTRjDkxdofEp5PW3RqCD4zv2EMGVvgltgLOUA31slsLNObSN
	 s/kOa5yRc2IOmi0z1Vo6Tk5+wMKKbNZmlo6Ny5lg=
Date: Tue, 22 Mar 2022 08:12:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jirka Hladky <jhladky@redhat.com>
Cc: stable@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev
Subject: Re: PANIC: "Oops: 0000 [#1] PREEMPT SMP PTI" starting from 5.17 on
 dual socket Intel Xeon Gold servers
Message-ID: <Yjl26QqwU1L2XWoh@kroah.com>
References: <CAE4VaGDZr_4wzRn2___eDYRtmdPaGGJdzu_LCSkJYuY9BEO3cw@mail.gmail.com>
 <CAE4VaGDKXnQJKdayeNsAD5RcqsKu5XG2UeweLvgZoFO-pn-t9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE4VaGDKXnQJKdayeNsAD5RcqsKu5XG2UeweLvgZoFO-pn-t9Q@mail.gmail.com>

On Tue, Mar 22, 2022 at 12:37:37AM +0100, Jirka Hladky wrote:
> Cc: regressions@lists.linux.dev stable@vger.kernel.org
> 
> On Tue, Mar 22, 2022 at 12:29 AM Jirka Hladky <jhladky@redhat.com> wrote:
> >
> > Starting from kernel 5.17 (tested with rc2, rc4, rc7, rc8) we
> > experience kernel oops on Intel Xeon Gold dual-socket servers (2x Xeon
> > Gold 6126 CPU)
> >
> > Bellow is a backtrace and the dmesg log.
> >
> > I have trouble creating a simple reproducer - it happens at random
> > places when preparing the NAS benchmark to be run. The script creates
> > a bunch of directories, compiles the benchmark a start trial runs.
> >
> > Could you please help to narrow down the problem?

Can you use 'git bisect' to track down the kernel commit that caused
this problem?

thanks,

greg k-h
