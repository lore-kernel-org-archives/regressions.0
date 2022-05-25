Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7E10E0
	for <regressions@lists.linux.dev>; Wed, 25 May 2022 15:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653493082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VRInkexwmTuHc361ogc4GS6wqKsIpJYzH/kvwhGn+HE=;
	b=UyjDq2Z0DGDKUPun1fGa9xulO64dz0jsQQ1Fn0dh/iC7ZM3rUKQuGaCsMC39ijmgnFXmsg
	E/Zy6BIbqOMTHWRT65gvd0D/AcnOyMwdgHiUjAI+D9YG5awlYNJF52kKq0rLSagHEZh70y
	SxedOcH4nfrqR4T+zdQSl1CpV9+g+KU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-8ncsaPV6M6upaOrK2Mv4sg-1; Wed, 25 May 2022 11:37:59 -0400
X-MC-Unique: 8ncsaPV6M6upaOrK2Mv4sg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9544619705BA;
	Wed, 25 May 2022 15:37:58 +0000 (UTC)
Received: from fuller.cnet (ovpn-112-2.gru2.redhat.com [10.97.112.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0541A400F38;
	Wed, 25 May 2022 15:37:58 +0000 (UTC)
Received: by fuller.cnet (Postfix, from userid 1000)
	id 529E5416F574; Wed, 25 May 2022 12:37:37 -0300 (-03)
Date: Wed, 25 May 2022 12:37:37 -0300
From: Marcelo Tosatti <mtosatti@redhat.com>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Mel Gorman <mgorman@techsingularity.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Phil Elwell <phil@raspberrypi.com>, regressions@lists.linux.dev
Subject: Re: vchiq: Performance regression since 5.18-rc1
Message-ID: <Yo5NQS470wTuDq/f@fuller.cnet>
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
 <YoszE8lQ9VcofLtX@linutronix.de>
 <Yo41ggMvkI1B9TeM@fuller.cnet>
 <e0402350-687e-14b6-2e30-4b459afa9afb@i2se.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0402350-687e-14b6-2e30-4b459afa9afb@i2se.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

On Wed, May 25, 2022 at 04:07:47PM +0200, Stefan Wahren wrote:
> Hi Marcelo,
> 
> Am 25.05.22 um 15:56 schrieb Marcelo Tosatti:
> > On Mon, May 23, 2022 at 09:09:07AM +0200, Sebastian Andrzej Siewior wrote:
> > > On 2022-05-22 01:22:00 [+0200], Stefan Wahren wrote:
> > > > Hi,
> > > Hi,
> > > 
> > > > while testing the staging/vc04_services/interface/vchiq_arm driver with my
> > > > Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
> > > > regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
> > > > lru_cache_disable: replace work queue synchronization with synchronize_rcu
> > > > 
> > > > Usually i run "vchiq_test -f 1" to see the driver is still working [1].
> > > What about
> > > 	https://lore.kernel.org/all/YmrWK%2FKoU1zrAxPI@fuller.cnet/
> > > 
> > > Sebastian
> > Stefan,
> > 
> > Can you please try the patch above ?
> 
> this was the same as Paul send. I think i need more time for investigation,
> maybe there is an issue with the application.

To clarify: they are not the same patches.

> 
> All i noticed so far is that in good case the CPU usage is around ~ 60 % and
> higher, while in bad case the CPU is almost idle. Also the issue is not
> reproducible with arm64/defconfig.
> 
> > 
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
> 

