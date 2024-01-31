Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381EB3B189
	for <regressions@lists.linux.dev>; Wed, 31 Jan 2024 19:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706730633; cv=none; b=XF21YvuC6SbFyhoYPBWvoQ717fJTVgRRyd3RPL7QdonUc9dE7y7H1qdD2r3eAZ38veq7Tg/tUbyBqWffUknxnv79ZonOKWhMcXUxR72MEN53q7RnwuHNxp0oszarsNBmOaWThV92x80v4MxdmAcDA2EXC2avGZgGVqyWGikdXP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706730633; c=relaxed/simple;
	bh=vm1VvPWS8u/0sVVO0sq2qAm/X+8Dw5pmdJyX/qXhvX8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=KZXmGHJV48wKczd5Mv0sZDZGfYEtbB77t658k5FBMJX8LcL3Ei/fwfKOMSQaWJsq7maW38/a0Hcfb87USsNdJ5UqFc1OACkLaEs5n/zlbfXAuDq7NSBFtJF6EChSFFxZ07ka5paW1Z1j/OEVDATlYSqQqpHzNBnJRczWly8RcsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JVBk3yAX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JVBk3yAX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706730630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rF0QFeVS0b/AoQ7bIaAq+Ck/8ND4nETi8q3EifYpCJ4=;
	b=JVBk3yAXjat2ww+J3Syl9hVaWZQmFDDxRttUtpVj31qjD5EnoK6aI/qIECafjZlZPvj65X
	qa9wRGKuy+bsfZZAiLa3xN8dIC6X+KV25/NIqEdEfie0hN/m0+xDt62SCCQ/MN4dEzT+Gn
	MniHn+2mdhX0x94QJPJObLXIFQ1nhkI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-7D72DHpwNK2O5iHGjDusPg-1; Wed, 31 Jan 2024 14:50:26 -0500
X-MC-Unique: 7D72DHpwNK2O5iHGjDusPg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 048FD84A291;
	Wed, 31 Jan 2024 19:50:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 56130C259DD;
	Wed, 31 Jan 2024 19:50:25 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240131155220.82641-1-bevan@bi-co.net>
References: <20240131155220.82641-1-bevan@bi-co.net>
To: Michael Lass <bevan@bi-co.net>
Cc: dhowells@redhat.com, netdev@vger.kernel.org,
    regressions@lists.linux.dev
Subject: Re: [PATCH] net: Fix from address in memcpy_to_iter_csum()
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2259906.1706730624.1@warthog.procyon.org.uk>
Date: Wed, 31 Jan 2024 19:50:24 +0000
Message-ID: <2259907.1706730624@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Michael Lass <bevan@bi-co.net> wrote:

> While inlining csum_and_memcpy() into memcpy_to_iter_csum(), the from
> address passed to csum_partial_copy_nocheck() was accidentally changed.
> This causes a regression in applications using UDP, as for example
> OpenAFS, causing loss of datagrams.
> 
> Fixes: dc32bff195b4 ("iov_iter, net: Fold in csum_and_memcpy()")
> Cc: David Howells <dhowells@redhat.com>
> Cc: stable@vger.kernel.org
> Cc: regressions@lists.linux.dev
> Signed-off-by: Michael Lass <bevan@bi-co.net>

Acked-by: David Howells <dhowells@redhat.com>

