Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8E51004
	for <regressions@lists.linux.dev>; Wed, 17 Apr 2024 07:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713337888; cv=none; b=g2XWT2izyY2eHUgZELKYfh8Qfd1CKNfAWOLsZaLF/Lq7Yrp+c3+4HZwVXZZKS+9qQ9yJn8FV67IhCF5K1S6kfrP2kp729JAhuBggrcHVPFzdRw2qpmSJx/KTMh9wIc+TSr0Qf2+aCMKsEzVvg9SWJeuJJgY98htVatEgD0KYFc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713337888; c=relaxed/simple;
	bh=4K57y2H0YophcOykf9QYuKDHY8mYB7EgGxsSKs0i7vw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RN4viUpnAokMo5TGHTAec2Za9sr+L1AFGVPNFw1sqfXwBi7j5jqNGk2NspvHfCJUtqRUby3op2yvi8g2W8bfh7Tr3InNLEW1ZGTQ1cr5EbdjPVH6nE3t190sWYb4PH/yIIpeG86zDkG/JH3u9ehQZzjxEoIaZsA+n+kxSTqCmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFHm1w1f; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFHm1w1f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713337885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4K57y2H0YophcOykf9QYuKDHY8mYB7EgGxsSKs0i7vw=;
	b=aFHm1w1f+sbng/7g+iMWQPY2B+JG85Vx3EA+1uGQLIkL3dkPV4XDPBtcTZJWltW8ektYFN
	ICbIMLsfSB1Q+eaZXPakQvDKxMc9ZfqX1+D4GnfpI03ZVy5a8ViKeQDHe/dxOhy+wcwfwD
	mlsGlcXVK49OFsPbAzo1Do4HrAOnx+s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-249-jQKToEXzPYOg9TC8VSPcyQ-1; Wed,
 17 Apr 2024 03:11:23 -0400
X-MC-Unique: jQKToEXzPYOg9TC8VSPcyQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4449E385A189;
	Wed, 17 Apr 2024 07:11:22 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.193.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B743D2166B31;
	Wed, 17 Apr 2024 07:11:18 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: carnil@debian.org
Cc: dave.stevenson@raspberrypi.com,
	gregkh@linuxfoundation.org,
	horms@kernel.org,
	jtornosm@redhat.com,
	kuba@kernel.org,
	linux-usb@vger.kernel.org,
	regressions@lists.linux.dev,
	roland@debian.org,
	sashal@kernel.org,
	stable@vger.kernel.org,
	weihao.bj@ieisystem.com
Subject: Re: [Regression] USB ethernet AX88179 broken usb ethernet names
Date: Wed, 17 Apr 2024 09:11:11 +0200
Message-ID: <20240417071113.7082-1-jtornosm@redhat.com>
In-Reply-To: <Zh7flXvNdDfattD9@eldamar.lan>
References: <Zh7flXvNdDfattD9@eldamar.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Hello Salvatore,

Sorry for the incoveniences.
I am working actively trying to fix this on this thread:
https://lore.kernel.org/netdev/20240410095603.502566-1-jtornosm@redhat.com/
Fedora is renaming the interface correctly but I think that could be related
with the mac address issue.
After this, let me check with you if the reported problem is fixed.

Best regards
José Ignacio


