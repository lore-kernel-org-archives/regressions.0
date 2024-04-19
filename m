Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B806080029
	for <regressions@lists.linux.dev>; Fri, 19 Apr 2024 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713525030; cv=none; b=qliKAUPtta4Jq5RgQimMl52X/1fGW/nF5fvV/lN27pdCgOVe2JpRUAdJR+hvEm++eNwHbDJJt5/e1YhTzKlRP4vOfRvImwwLAqyj5E5R790BTWJUcpC3vIxsKny/cJ994ne+vFYX+k0KIUWXMYmw1ttQKCrcCdeUpSIXhYNc5QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713525030; c=relaxed/simple;
	bh=4Mfzr1V6BFWHxC7o7yqVo53Mcbn4awlE5eUpGg/8hRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e23nsSpQ6Yujdxrlm3sLiDl782BjwPm7pu9mbQMKskr/Vg9nc16Sl0/FwGvJyQjZnSaWLGydT3pm/0Tvfr7v6sRimhs259jg12TQj69LdIu5I2KY3NBtzTJNvKADILW5C8lw1go+hwmqzk+kuGrCDZjefd6ZuKwqfy2/320mH3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cW/Qsl/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cW/Qsl/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713525027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GAl4uBdr7zjiQsXmmQYRw/OPYh/GNIIDVhDzRB8Ef+g=;
	b=cW/Qsl/S6nt+XGWxZ4TVFWlKDq1MYRsHjktjr6PEuGmicZO1xC/SOjDwEznKkNXP8Nb3uG
	ANPBD8IZtMIum/NUZinnTIi2mFCH64mxQOKsSPbi92sA6tpm+4XDsy1DHPoJwpu0PBjXn3
	D/K2LtsgxLJ0fgUkFRBTiJJsqCgvXa8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-282-DUeJI6ypPuW1duhBzGTpNA-1; Fri,
 19 Apr 2024 07:10:24 -0400
X-MC-Unique: DUeJI6ypPuW1duhBzGTpNA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CDE9C1C2CDE0;
	Fri, 19 Apr 2024 11:10:23 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.250])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DF881121313;
	Fri, 19 Apr 2024 11:10:20 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jtornosm@redhat.com
Cc: carnil@debian.org,
	dave.stevenson@raspberrypi.com,
	gregkh@linuxfoundation.org,
	horms@kernel.org,
	kuba@kernel.org,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev,
	roland@debian.org,
	sashal@kernel.org,
	stable@vger.kernel.org,
	weihao.bj@ieisystem.com
Subject: Re: [Regression] USB ethernet AX88179 broken usb ethernet names    
Date: Fri, 19 Apr 2024 13:10:16 +0200
Message-ID: <20240419111019.133748-1-jtornosm@redhat.com>
In-Reply-To: <20240417071113.7082-1-jtornosm@redhat.com>
References: <20240417071113.7082-1-jtornosm@redhat.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Hello Salvatore,

Fix is there:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/?id=56f78615bcb1
And now in linux.

I have successfully tested it with ubuntu, installing the latest linux
upstream kernel:

$ lsb_release -a
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
$ uname -a
Linux unbuntu-test 6.9.0-rc4+ #8 SMP PREEMPT_DYNAMIC Fri Apr 19 11:59:17 CEST 2024 x86_64 x86_64 x86_64 GNU/Linux
$ sudo dmesg | grep ax88
[    3.848935] ax88179_178a 1-9:1.0 eth0: register 'ax88179_178a' at usb-0000:00:14.0-9, ASIX AX88179 USB 3.0 Gigabit Ethernet, aa:20:18:10:09:63
[    3.848956] usbcore: registered new interface driver ax88179_178a
[    3.854332] ax88179_178a 1-9:1.0 enxaa2018100963: renamed from eth0

Best regards
José Ignacio

