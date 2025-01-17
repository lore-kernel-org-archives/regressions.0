Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18111F63CF
	for <regressions@lists.linux.dev>; Fri, 17 Jan 2025 03:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737085290; cv=none; b=bew9Oisfnvk+ig15HFkYP8z/Ga/Avi16Y9i5ltqoSNXk+8xfbuIB8SRAI7sd0nsUgZ8O4ShAI0ToyS5gnfWdS+yxqQlXr0OLx0jTWnAvT0KZQ1elsjo3RRBYIRuQRHS9O7L6w9yuBLvvQjtSQAs6nuQa+NxRhfdeQozjSKPypyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737085290; c=relaxed/simple;
	bh=YMWd9WTCfl+pmp9VBwB8sa2KM+zbCZYG2YGhqW8vPvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z//uYcV8hDcBB3F8xk/4qLyEJUJzcx7wcBPZ4dRj5YPjLAOZCSTodj5qVO2Ye+oQU40AZRpWxoY9GsvTC/ucukbMTiSk1mHFw1u9qA5Zw0x4JM7gtTPQbshipDi6oFrWE5mgfNyItBOV0AGVlYvF5W5aKqVRanLWwxEcEF6MYDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ePLS2SBJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ePLS2SBJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737085287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JicVrS6630U6GLKgttTEGLfxPYMVZnTHvkxIjdKwIR8=;
	b=ePLS2SBJdeo0UNtQ34ed2TF+dPsa2a6ki5xMNRUbe1cnxdbdNWuACmFXD0bKiundsmInXL
	9WKe0bRLHArqo5PTmotwlMT7KHi+yJRZC0j/bdaIiQeXqSAog3S/R1yTTnyCmVjYV17Ah1
	U1DgH6TAPZXs+SB9+z19WqWKe90Qe40=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-9Nugs1zqOY6ARK2pr1smzg-1; Thu,
 16 Jan 2025 22:41:23 -0500
X-MC-Unique: 9Nugs1zqOY6ARK2pr1smzg-1
X-Mimecast-MFC-AGG-ID: 9Nugs1zqOY6ARK2pr1smzg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A4D619560B7;
	Fri, 17 Jan 2025 03:41:21 +0000 (UTC)
Received: from localhost (unknown [10.72.112.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B113E30001BE;
	Fri, 17 Jan 2025 03:41:19 +0000 (UTC)
Date: Fri, 17 Jan 2025 11:41:14 +0800
From: Baoquan He <bhe@redhat.com>
To: Roberto Ricci <io@r-ricci.it>
Cc: Andrew Morton <akpm@linux-foundation.org>, ebiederm@xmission.com,
	rafael@kernel.org, pavel@ucw.cz, ytcoode@gmail.com,
	kexec@lists.infradead.org, linux-pm@vger.kernel.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from
 hibernation
Message-ID: <Z4nRWnysvuxLWU32@MiWiFi-R3L-srv>
References: <Z4WFjBVHpndct7br@desktop0a>
 <Z4Zjmva-pLbLjtQv@desktop0a>
 <Z4czuvi2BiNlDWPP@MiWiFi-R3L-srv>
 <Z4ejbdJr87V3IwV8@desktop0a>
 <Z4jy-NoLxpwaLfyD@desktop0a>
 <Z4m4q8yfIjfMRgZ+@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4m4q8yfIjfMRgZ+@MiWiFi-R3L-srv>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 01/17/25 at 09:55am, Baoquan He wrote:
> On 01/16/25 at 12:52pm, Roberto Ricci wrote:
> > On 2025-01-15 Wed 13:00:52 +0100, Roberto Ricci wrote:
> > > On 2025-01-15 Wed 12:04:10 +0800, Baoquan He wrote:
> > > > On 01/14/25 at 02:16pm, Roberto Ricci wrote:
> > > > > On 2025-01-13 Mon 22:28:48 +0100, Roberto Ricci wrote:
> ...snip...
> > Also, I can't reproduce with the default config (make defconfig),
> > therefore something in my config (I already sent it) may play a role.
> 
> What I tried is defconfig on 6.13-rc7, let me try your config again.

I tried your config on the latest kernel, reboot will fail during the
new kernel bootup after newly built kernel was installed.

I haven't compared your config with the defconfig to see their
difference. Wondering where your config comes from.

