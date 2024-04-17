Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2CF140E46
	for <regressions@lists.linux.dev>; Wed, 17 Apr 2024 15:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713366505; cv=none; b=EBM2bBKZK6MJylLViUfof42yzAOGll47nYYwW8+5YneooyHVMMVG3/4IW1zQMEjW0eEP5sGBn61u3vS9qTcvG3VvvqgwqHWwxgk1JjjwKiG2omlV3/FkyWz3VQVbbnDvhmfUH6qkhH8fJBLVHqoZpL5+fDZvAm+Zszb/tTLkJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713366505; c=relaxed/simple;
	bh=G8xgs0TJ6NLjXmJLzGHFiLBY6t6LzdrcaViaEQIsWCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tZHT//XAnEMV4DbuzlBvGyk00AQ6UkUCSQU2T+G5jjLH4JHhdeWh3Vb7EwER7hmGylXBW3TZ1q8oNbxiRpHIzTtBe67Uhlr11lfNolL6Dbd4GxbgLT9+0LM7yXAKDgdBri9ZLub5SfENcZwZ9fSQci6V43m58tXC+fuUv1ChM9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZXEdElPq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZXEdElPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713366502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+F4OvKnama+fi/vECsUu3ihfZcSjtcUfDj1tT/W9L28=;
	b=ZXEdElPqgCABSAkaAX66sV6VvGKAoJ5B6aIUtUimEnlq5odbtgffZJcjJRvZcIzwIyvAxF
	+A5Cr9v6TKKdr1WC2d0GjRLMIcCNdjEuFFDPPMmcafBOZTN9Kub4bKRIsQq+3A+NxTxi4f
	AXCpRaTmRH/3GByI9FA0MbWl5Xg8kEQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-VesNRI35Opul_7gtbJ7P5A-1; Wed, 17 Apr 2024 11:08:16 -0400
X-MC-Unique: VesNRI35Opul_7gtbJ7P5A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 231E210499A0;
	Wed, 17 Apr 2024 15:08:16 +0000 (UTC)
Received: from localhost (unknown [10.42.28.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5E0A3480F21;
	Wed, 17 Apr 2024 15:08:15 +0000 (UTC)
Date: Wed, 17 Apr 2024 16:08:10 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Chengming Zhou <chengming.zhou@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Christian Heusel <christian@heusel.eu>,
	Seth Jennings <sjenning@redhat.com>,
	Dan Streetman <ddstreet@ieee.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, David Runge <dave@sleepmap.de>,
	Mark W <instruform@gmail.com>, regressions@lists.linux.dev,
	Yosry Ahmed <yosryahmed@google.com>
Subject: Re: [REGRESSION] Null pointer dereference while shrinking zswap
Message-ID: <20240417150810.GA7636@redhat.com>
References: <3iccc6vjl5gminut3lvpl4va2lbnsgku5ei2d7ylftoofy3n2v@gcfdvtsq6dx2>
 <CAKEwX=MZ3jTVpN4g-qrhTn2b0i0C6_M=8BtKt9KEPyFHb+4W2w@mail.gmail.com>
 <CAKEwX=NM1y-K1-Yw=CH3cM-8odER1PZBVoWo-rs7_OdjFG_puw@mail.gmail.com>
 <CAKEwX=MWPUf1NMGdn+1AkRdOUf25ifAbPyoP9zppPTx3U3Tv2Q@mail.gmail.com>
 <246c1f4d-af13-40fa-b968-fbaf36b8f91f@linux.dev>
 <20240417143324.GA1055428@cmpxchg.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240417143324.GA1055428@cmpxchg.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

On Wed, Apr 17, 2024 at 10:33:24AM -0400, Johannes Weiner wrote:
> I could reproduce the NULL crash locally with cgroup_disable=memory,
> the shrinker enabled, and echo 3 >/proc/sys/vm/drop_caches.

Can confirm that libguestfs uses cgroup_disable=memory for its
appliance (as it saves some RAM and we don't need cgroups).

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html

