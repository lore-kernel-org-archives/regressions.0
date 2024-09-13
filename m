Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D667574E26
	for <regressions@lists.linux.dev>; Fri, 13 Sep 2024 16:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726243461; cv=none; b=C48nAhflGY81AENn0LFYrxsrcPoW/ypZRzV6SKrQctjy1O47e/Hcn7qos4fjQ2G3yJt3BL8CW+/iuw4znLNMehEmaS8b2XO+C9f7lP5Fg7VSuMOJVxFtg7eC7IDZECTdVphl+3ZZB5HdKRAgMX5sMYnxpyRAjUk4lC4pnkgorug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726243461; c=relaxed/simple;
	bh=NfO8PQsdFTw2NJ0rNaRUatmDxQ3RMvr1qwD92F1+mdI=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Ft7tx6Nh/etwGQidw+s91Ve11A5KOs82m7U6I8NL0mM7W47/PdbKKWwkxaWv+TE1Y9BekicN04lZk+OFeWmHkajZDCL2iCXeDaGzyyhBegldvzAbu82+YRBea9xasgYntrjcC2vwdIKJRGElHQbgXoblJBATj3SwGf/zbTgVneA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VA5kpKyL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VA5kpKyL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726243458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NfO8PQsdFTw2NJ0rNaRUatmDxQ3RMvr1qwD92F1+mdI=;
	b=VA5kpKyLd2agaKmCS0BBc4t0gjFLSfgGOcuCla4Kvx7CDPwJvA4o4s85PeIj0mPnDAjm4A
	kkQhUi6VriWiCAlXI1u46030Fqj65n0LuwxgF/GbPDpE9owe+FR4YiX44Sco5jJCl1BZuG
	TK4Zv6lQKsdWGz7LFny/7kEDJnbt9FQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-501-S8xWBQA1P72CQYcCth2Elw-1; Fri,
 13 Sep 2024 12:04:15 -0400
X-MC-Unique: S8xWBQA1P72CQYcCth2Elw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EEDD21955F3E;
	Fri, 13 Sep 2024 16:04:12 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0DFCC1956048;
	Fri, 13 Sep 2024 16:04:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d4a1cca4-96b8-4692-81f0-81c512f55ccf@meta.com>
References: <d4a1cca4-96b8-4692-81f0-81c512f55ccf@meta.com> <A5A976CB-DB57-4513-A700-656580488AB6@flyingcircus.io> <ZuNjNNmrDPVsVK03@casper.infradead.org> <0fc8c3e7-e5d2-40db-8661-8c7199f84e43@kernel.dk> <CAHk-=wh5LRp6Tb2oLKv1LrJWuXKOvxcucMfRMmYcT-npbo0=_A@mail.gmail.com>
To: Chris Mason <clm@meta.com>
Cc: dhowells@redhat.com, Linus Torvalds <torvalds@linux-foundation.org>,
    Jens Axboe <axboe@kernel.dk>, Matthew Wilcox <willy@infradead.org>,
    Christian Theune <ct@flyingcircus.io>, linux-mm@kvack.org,
    "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
    Daniel Dao <dqminh@cloudflare.com>,
    Dave Chinner <david@fromorbit.com>, regressions@lists.linux.dev,
    regressions@leemhuis.info
Subject: Re: Known and unfixed active data loss bug in MM + XFS with large folios since Dec 2021 (any kernel from 6.1 upwards)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1368974.1726243446.1@warthog.procyon.org.uk>
Date: Fri, 13 Sep 2024 17:04:06 +0100
Message-ID: <1368975.1726243446@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Chris Mason <clm@meta.com> wrote:

> I've mentioned this in the past to both Willy and Dave Chinner, but so
> far all of my attempts to reproduce it on purpose have failed.

Could it be a splice bug?

David

