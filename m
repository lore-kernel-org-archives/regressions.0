Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53A35949
	for <regressions@lists.linux.dev>; Wed, 15 Jan 2025 04:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736913866; cv=none; b=qoiy0XiHF+DFvCadbj07QTWpK9xv5V5fR1dxBXm2P4t7kRbg34s92uD7/dwD0x1b98GotMGR0za0b1fUjJt0k1Y5ovg1h6AXQwQEVrj8azGrjnc1x+UwAgoTCOZISWFMXQqoA45yY2BJkF0CZUVGeWh28I74BfAq9NH1D1uqJbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736913866; c=relaxed/simple;
	bh=OutPCBssKJH51fBJ7ANy7MsTaNa+Uu9yOZ3Iho1madA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m8E9A3G2JS5bbfAFHNUX+Eh7y8VlbpyrjafbiWJ/79k+G+Z6UsqrNq0DSmIpU3umt9RDl0aMgxxdI76B8Ly8FIfygNeuNvgVkIxoMFNuGwJUYPOJ6cthQt63qa8vtLwdYzjxIa02b+sfR9Qkh4MYyzVUie7Vp7N35kO3Yp0gKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FUtLBntc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FUtLBntc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736913863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+unhOYBjiPAqZTRFood5aIiHdu2obot7zgKwQr1T8N4=;
	b=FUtLBntcyqMCSXaLD5boiFnqHGnrIceY3ViT06ZiNrlmTjhXGrigTo/qlw/FVqEZZpoAme
	PDAUaQIJdxqaxIKZVRGqttGs5PE4Sd+V3WgJUFFlsaQWAl+OYchsNPL/txK8g/NBBuPN5S
	0a28wMuoLDkhGYPTU5wFFqNRLYQO0Zk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-662-D0RozbHVNbOEewaG-IRirA-1; Tue,
 14 Jan 2025 23:04:21 -0500
X-MC-Unique: D0RozbHVNbOEewaG-IRirA-1
X-Mimecast-MFC-AGG-ID: D0RozbHVNbOEewaG-IRirA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 80ED71955DDF;
	Wed, 15 Jan 2025 04:04:18 +0000 (UTC)
Received: from localhost (unknown [10.72.112.24])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CE473003FD9;
	Wed, 15 Jan 2025 04:04:15 +0000 (UTC)
Date: Wed, 15 Jan 2025 12:04:10 +0800
From: Baoquan He <bhe@redhat.com>
To: Roberto Ricci <io@r-ricci.it>
Cc: ebiederm@xmission.com, rafael@kernel.org, pavel@ucw.cz,
	ytcoode@gmail.com, kexec@lists.infradead.org,
	linux-pm@vger.kernel.org, akpm@linux-foundation.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from
 hibernation
Message-ID: <Z4czuvi2BiNlDWPP@MiWiFi-R3L-srv>
References: <Z4WFjBVHpndct7br@desktop0a>
 <Z4Zjmva-pLbLjtQv@desktop0a>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4Zjmva-pLbLjtQv@desktop0a>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 01/14/25 at 02:16pm, Roberto Ricci wrote:
> On 2025-01-13 Mon 22:28:48 +0100, Roberto Ricci wrote:
> > I can reproduce this with kernel 6.13-rc7 in a qemu x86_64 virtual machine
> > running Void Linux, with the following commands:
> > 
> > ```
> > # kexec -l /boot/vmlinuz-6.13.0-rc7 --initrd=/boot/initramfs-6.13.0-rc7 --reuse-cmdline
> > # reboot
> > # printf reboot >/sys/power/disk
> > # printf disk >/sys/power/state
> > ```
> 
> Looks like it's the kernel performing the kexec which causes the issue,
> not the target one. E.g.: kexec-ing 6.7 from 6.13-rc7 makes resume from
> hibernation fail; but if I kexec 6.13-rc7 from 6.7, then it works fine.

I tried the latest mainline kernel with your above command execution
series, I didn't see the problem you reported. Can you try kexec from
6.7 to 6.7 or something like that and try to bisect a specific criminal
commit?

As for below commit, it seems not a suspect.
18d565ea95fe ("kexec_file: fix incorrect temp_start value in locate_mem_hole_top_down()")

If possible, can you revert below two commits altogether to have a try?
I am not sure if they caused the problem.

18d565ea95fe kexec_file: fix incorrect temp_start value in locate_mem_hole_top_down()
816d334afa85 kexec: modify the meaning of the end parameter in kimage_is_destination_range()

Thanks
Baoquan

