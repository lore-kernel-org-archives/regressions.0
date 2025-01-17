Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9108B25A65B
	for <regressions@lists.linux.dev>; Fri, 17 Jan 2025 01:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737078971; cv=none; b=VF8MzIKNWGrKA13JBYnAv4KGt8nSLvpsyoInwNrTmGjPJjwvON50YEN9rGvuat6GKnL8J760xq77ny4pSdJ/duqhaJXassCNNgmHcLlDJ56AzHvepd7xfLQw8PBT/Mf3T4myNYzdlj0ISXDxmCZ+lDpwzOj7pzkAS1Rtrl4PoFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737078971; c=relaxed/simple;
	bh=FBe3eeTEFS2c2V0/g2HvswYNSDDgWbxsTGLzAw3EfuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuXM0OsUa3LZ8WC4NNJ7Bj3IckeBh8fHGty55OPzFgH1V4vCAXqn8JgroZWo8tXnWFccA6ibC1hOdSPa3r0w2+JHtGhqIkqRF/twKn0SXoxcwMXDFiMIgeaomfEwU12AOYW99APFL1m1zQNJ4nC3czYWm35PD//PrX2zjhDgyaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UY1m4Zo/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UY1m4Zo/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737078968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FBe3eeTEFS2c2V0/g2HvswYNSDDgWbxsTGLzAw3EfuQ=;
	b=UY1m4Zo/01C5rQA5E+To7Fi86RSQei58RKQuVu6+ouNR2CYPyyJd9tX4cD0JW4W9CpOi2i
	SL1WL/fF1ScQbBVyk0GdEaGYCCWo57E8eam6LzXArR2Ha1HAP6w1sFl4YptzAYCJekcjYt
	ngfZNk3Aj0NmKtminABpl6WlhXx9X/k=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-169-84aStPJhPwWpmp7hpABuyA-1; Thu,
 16 Jan 2025 20:56:05 -0500
X-MC-Unique: 84aStPJhPwWpmp7hpABuyA-1
X-Mimecast-MFC-AGG-ID: 84aStPJhPwWpmp7hpABuyA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CDDBA19560AB;
	Fri, 17 Jan 2025 01:56:02 +0000 (UTC)
Received: from localhost (unknown [10.72.112.4])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C485195608A;
	Fri, 17 Jan 2025 01:56:00 +0000 (UTC)
Date: Fri, 17 Jan 2025 09:55:55 +0800
From: Baoquan He <bhe@redhat.com>
To: Roberto Ricci <io@r-ricci.it>
Cc: Andrew Morton <akpm@linux-foundation.org>, ebiederm@xmission.com,
	rafael@kernel.org, pavel@ucw.cz, ytcoode@gmail.com,
	kexec@lists.infradead.org, linux-pm@vger.kernel.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from
 hibernation
Message-ID: <Z4m4q8yfIjfMRgZ+@MiWiFi-R3L-srv>
References: <Z4WFjBVHpndct7br@desktop0a>
 <Z4Zjmva-pLbLjtQv@desktop0a>
 <Z4czuvi2BiNlDWPP@MiWiFi-R3L-srv>
 <Z4ejbdJr87V3IwV8@desktop0a>
 <Z4jy-NoLxpwaLfyD@desktop0a>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4jy-NoLxpwaLfyD@desktop0a>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On 01/16/25 at 12:52pm, Roberto Ricci wrote:
> On 2025-01-15 Wed 13:00:52 +0100, Roberto Ricci wrote:
> > On 2025-01-15 Wed 12:04:10 +0800, Baoquan He wrote:
> > > On 01/14/25 at 02:16pm, Roberto Ricci wrote:
> > > > On 2025-01-13 Mon 22:28:48 +0100, Roberto Ricci wrote:
...snip...
> Also, I can't reproduce with the default config (make defconfig),
> therefore something in my config (I already sent it) may play a role.

What I tried is defconfig on 6.13-rc7, let me try your config again.

