Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1C1D1F6F
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725639786; cv=none; b=UlslH5cy6aw8KXNrD11arRgREeX2QupVKDBJatbsm8uBlFpRp/28VeJWm6rC0JwiERNXfahymqxv5R8Hqd30oCYuqdoIpjRoRS+vkFWFKFuhQ5SVDUUQRJYX7ila+kNPxVe4zrRcEc898JbKleUoiqCIsv15QI7Z66Elz0XW/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725639786; c=relaxed/simple;
	bh=fS/zCZRcdqBRpXPYngRBghtR8qMeqNGYgofN4G8HWzs=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=kSS9Ec3AnkzLTMCPB5/nC8owKGRHI3ONo4+zgTgJ/LJkJTwWql3HKyQAYmUVP5DY8B6kXA6xZjU6TNQs20/YWpsWYvjZXL7IqveTqIudZY+9DxQYE38C5uzDgDmks4Fyfl70zBRvUtrOkUWZWUhV1TX+YdLepmEbXYIBbrSlC38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bC7VXqBt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bC7VXqBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725639784;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fS/zCZRcdqBRpXPYngRBghtR8qMeqNGYgofN4G8HWzs=;
	b=bC7VXqBtkwXDu9/2SqaVxreW0Vb489Ed1shBvsKZjIMX+viz+ALXMjM1uUrf9gQokmN6sm
	09QZHVOWLVRaAzduHvqWks2zrxucrwiIc6dU+ePgb44fVeM8aVcqmOtot98BTrZZhFBMM2
	X8c1YfrUVgKlco+eyVSzXVOGL9VaMQ8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-668-ka47LoxQP1qgVe7ZYMxK4g-1; Fri,
 06 Sep 2024 12:23:02 -0400
X-MC-Unique: ka47LoxQP1qgVe7ZYMxK4g-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF6481955F43;
	Fri,  6 Sep 2024 16:23:00 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.67])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AA7EB1956048;
	Fri,  6 Sep 2024 16:22:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <85bef384-4aef-4294-b604-83508e2fc350@proxmox.com>
References: <85bef384-4aef-4294-b604-83508e2fc350@proxmox.com>
To: Christian Ebner <c.ebner@proxmox.com>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, Xiubo Li <xiubli@redhat.com>,
    regressions@lists.linux.dev, ceph-devel@vger.kernel.org,
    stable@vger.kernel.org
Subject: Re: [REGRESSION]: cephfs: file corruption when reading content via in-kernel ceph client
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <127720.1725639777.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Sep 2024 17:22:57 +0100
Message-ID: <127721.1725639777@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Christian Ebner <c.ebner@proxmox.com> wrote:

> some of our customers (Proxmox VE) are seeing issues with file corruptio=
ns
> when accessing contents located on CephFS via the in-kernel Ceph client =
[0,1],
> we managed to reproduce this regression on kernels up to the latest 6.11=
-rc6.
> Accessing the same content on the CephFS using the FUSE client or the
> in-kernel ceph client with older kernels (Ubuntu kernel on v6.5) does no=
t show
> file corruptions.

Are they using local caching with cachefiles?

David

