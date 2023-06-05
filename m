Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2A21DDCB
	for <regressions@lists.linux.dev>; Mon,  5 Jun 2023 14:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685975231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VqvDjKPajBQJ0jhTbAvNmVVCOt81m2LxIym/sZ9cqd8=;
	b=au7CoyDiI4YjEwJXDoqrb2uhbVB07ezEfcAqZuS6TeeLL022CXagAbmpihVhAqjkmUkHG1
	B6muTqV9xqaEEe59JNP1rDYZWGIi8isY7XPnY6mCdBtCPcYJBl88fZWzhr0JP/1pt+2MnE
	6/c5145hHY8lkDPCvZhKdZBMQii3L1o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-O_8wkhTTOjSn0hsnxZkI9w-1; Mon, 05 Jun 2023 10:27:08 -0400
X-MC-Unique: O_8wkhTTOjSn0hsnxZkI9w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC0D48030CD;
	Mon,  5 Jun 2023 14:27:05 +0000 (UTC)
Received: from mail.corp.redhat.com (unknown [10.45.225.227])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04BE84A927E;
	Mon,  5 Jun 2023 14:27:03 +0000 (UTC)
Date: Mon, 5 Jun 2023 16:27:01 +0200
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Jiri Kosina <jikos@kernel.org>, Bastien Nocera <hadess@hadess.net>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Peter F . Patel-Schneider" <pfpschneider@gmail.com>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, 
	Nestor Lopez Casado <nlopezcasad@logitech.com>, Mark Lord <mlord@pobox.com>
Subject: Re: [PATCH] HID: logitech-hidpp: Handle timeout differently from busy
Message-ID: <7ko33em3pqdaeghkt6wumzks6fz2lzztmqyhyzvv3kisjovmvr@mojlmkmrqlml>
References: <20230531082428.21763-1-hadess@hadess.net>
 <nycvar.YFH.7.76.2305311606160.29760@cbobk.fhfr.pm>
 <nycvar.YFH.7.76.2306031440380.29760@cbobk.fhfr.pm>
 <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15bb2507-a145-7f1b-8e84-58aeb02484b9@leemhuis.info>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


On Jun 05 2023, Linux regression tracking (Thorsten Leemhuis) wrote:
> 
> On 03.06.23 14:41, Jiri Kosina wrote:
> > On Wed, 31 May 2023, Jiri Kosina wrote:
> > 
> >>> If an attempt at contacting a receiver or a device fails because the
> >>> receiver or device never responds, don't restart the communication, only
> >>> restart it if the receiver or device answers that it's busy, as originally
> >>> intended.
> >>>
> >>> This was the behaviour on communication timeout before commit 586e8fede795
> >>> ("HID: logitech-hidpp: Retry commands when device is busy").
> >>>
> >>> This fixes some overly long waits in a critical path on boot, when
> >>> checking whether the device is connected by getting its HID++ version.
> >>>
> >>> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> >>> Suggested-by: Mark Lord <mlord@pobox.com>
> >>> Fixes: 586e8fede795 ("HID: logitech-hidpp: Retry commands when device is busy")
> >>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217412
> > [...]  
> >>
> >> I have applied this even before getting confirmation from the reporters in 
> >> bugzilla, as it's the right thing to do anyway.
> > 
> > Unfortunately it doesn't seem to cure the reported issue (while reverting 
> > 586e8fede79 does):
> 
> BTW, remind me again: was fixing this by reverting 586e8fede79 for now a
> option? I guess it's not, but if I'm wrong I wonder if that might at
> this point be the best way forward.

Could be. I don't think we thought at simply reverting it because it is
required for some new supoprted devices because they might differ
slightly from what we currently supported.

That being said, Bastien will be unavailable for at least a week AFAIU,
so maybe we should revert that patch.

> 
> > https://bugzilla.kernel.org/show_bug.cgi?id=217523#c2
> 
> FWIW, another comment showed up there:
> 
> ```
> > --- Comment #6 from vova7890 ---
> > Same problem. I researched this some time ago. I noticed that if I add a small
> > delay between commands to the dongle - everything goes fine. Repeated
> > request(586e8fede7953b1695b5ccc6112eff9b052e79ac) made the situation more
> > visible

I don't think I ever had to add any delays between commands. The USB
stack should be capable of forwarding the commands just fine. So unless
the receiver is of a different hardware (but same VID/PID) that might
expose a problem elsewhere (in the USB controller maybe???). Just a long
shot, but maybe getting the config of the impacted users and what are
the USB controllers/drivers they are using might gives us a better
understanding.

Cheers,
Benjamin

