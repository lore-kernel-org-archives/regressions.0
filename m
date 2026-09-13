Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470293D3488
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 07:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286135; cv=none; b=shn1mKDbdV9ChdE7iNFEgCDx4O+a/UyUCO24dfR5Ec3nqfUnhYqvE7HgCUIj92fcZDxFTjdZRGWB0SDEVOOTRonOsO1MygSsq5ScLwQUjO2jGzz21+0QPviR/MnHaNs1Xmj3IeX8LOCR7sGSKdeMCUyLtVoLE7YLCnSJonCWFEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286135; c=relaxed/simple;
	bh=As5kpy/SLue7mgIjEWjGCe5iKFeH3Ak3IjbKgOi4fRU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:Date:
	 Message-ID:Content-Type; b=mPRSQX/WW7kEBnbze+EoWw4dPKGUdrVuSI2o3Vk7wEA29N5F1BhPyqL7h4eCE0SGp0cHlH9CfjMKeWzz3rF9JDxUoP+opNn65HIEyqpVxQSBqgnjHweSqJ+7SM+gUiTW2UPc/CbeHnfzBn0SruC9JBrNOb6KnAP7DGDONuS2As0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MHt4vDay; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MHt4vDay"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789286125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=As5kpy/SLue7mgIjEWjGCe5iKFeH3Ak3IjbKgOi4fRU=;
	b=MHt4vDaytStLb5OUv3U3zg4K9rJng4J+DXNPiBNTeKH6nFw4yofJ8PmtCeZLsp5ACWLvec
	ABQnCb4NlGJyFGG0iT+ijemygL3bW+4c6etlwDfLNXqrMZWlBycEpk+DuiciwbnJmC+w3A
	1jQLTkIfDsuItpuEL3N4iBG5VuNV14c=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-uI4LYe9oOUKo9uXkejPhWw-1; Sun,
 13 Sep 2026 03:55:21 -0400
X-MC-Unique: uI4LYe9oOUKo9uXkejPhWw-1
X-Mimecast-MFC-AGG-ID: uI4LYe9oOUKo9uXkejPhWw_1789286120
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51EAB18007F1;
	Sun, 13 Sep 2026 07:55:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.44.32.54])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 493621956087;
	Sun, 13 Sep 2026 07:55:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aqUIEEvKad-o-zft@codewreck.org>
References: <aqUIEEvKad-o-zft@codewreck.org> <fbb9e395-1e07-4212-8f70-23f3cd498074@method-b.uk> <2226525.1789118704@warthog.procyon.org.uk>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Michael Mulqueen <mike@method-b.uk>,
    ericvh@kernel.org, lucho@ionkov.net, pc@manguebit.org,
    linux_oss@crudebyte.com, v9fs@lists.linux.dev, netfs@lists.linux.dev,
    linux-fsdevel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: PROBLEM: [REGRESSION 7.1-rc4 -> 7.1-rc5] 9p: silent NUL corruption of file data on cache modes with CACHE_WRITEBACK
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 08:55:13 +0100
Message-ID: <2718782.1789286113@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: I-uCR3pJmFn-iv8_qAe6dSMcf2wv6cveHxTgT9ZkqLI_1789286120
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2718781.1789286113.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable

Dominique Martinet <asmadeus@codewreck.org> wrote:

> When v9fs_issue_write() is re-entered, writing the remaining data at the
> original subreq->start offset rather than subreq->start + subreq->transfe=
rred
> would overwrite previously written data.

Retry should now be resetting ->transferred to 0, so actually I should remo=
ve
adding ->transferred from other filesystems.

> > +=09=09spin_lock(&inode->i_lock);
> > +
> > +=09=09/* We can read the sizes directly as we hold i_lock. */
> > +=09=09i_size =3D inode->i_size;
> Does reading and updating i_size from this asynchronous writeback path ra=
ce
> with concurrent truncate operations?

Supposedly, you're not allowed to change i_size unless you hold
i_lock... which we do.

> Also, reading inode->i_size directly without i_size_read() bypasses
> i_size_seqcount, which can cause torn reads on 32-bit platforms.

Which should be irrelevant as we hold i_lock.

David

