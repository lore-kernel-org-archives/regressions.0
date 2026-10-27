Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793126515;
	b=ikT6v/MDttPHwh83z8E/RwcF7p1WBf7HZ1QuOLofJwLK026THcfa74WYLzZEAFaguF38
	 rp10eQlaY7BrGCMAqe2SWJYOTchERT4Inxj9FzA7bEy4s1v8LAlCAXdXwjkck8SEQG2dV
	 wQkTLaHjCKx57E78K8Sm3LHNh4naWm28oly3RV7focmvSVjN3fdfjHikh90Qz+O1GKvsw
	 Eo0ka96Pe9+v12WTgmJkd1K9PNRedJYnVan3eOSN0SqzYepm1TjJdq8gR/AJOZn8nBYNT
	 FdUh4475pbQUKnoJvc4tOrzKYVfHWhSS9v6/ATE0/XIgo8582tvNBZwUh/XlRnC6zAg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126515;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=MYyW/xXo/G0tg/sdPEATKJsUvKH9DdQaOm8Y83GXt/4=;
	b=jT76drgqe2DOGN0hNt7/snMsCUR+wIeKqlKX4PVqLJO4yzBBxWKTMy0kWqPAYkD90eQl
	 MMRi0l4/yUrS4MOMWresWdutEmszW7OuYbXFyRX8fs+VAAn5vbkMdnHU7VK95aNZKaHn/
	 2JtVuwIuGYWV7oqnSPPvP86f2nDQAOKKPTbHR65OLAJcE83sFThiFQEFdO5LnLGrjj0Te
	 yYhkHucHr1td1qt47y5p098OQDJOowlsCvUpN1c7IR5RYLTsMWyGFzz49h29steIho+ao
	 tG5hYlloZ2IGcSLawymo1czizm0ESIbufVHxxYzcY72hU2EESJOMiUHR6AffkOt1lxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=yiyuzhou.io;
	spf=pass smtp.mailfrom=yiyuzhou.io;
	dkim=pass header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=HX36CgBn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02712606A31D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 18:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02712606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.a=rsa-sha256 header.s=zmail header.b=HX36CgBn
ARC-Seal: i=1; a=rsa-sha256; t=1793126500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dJRfEYwmuIzjO+/Z1667qSn4if+O+nt52WQ6eVkindw07jnWUGvFCYlLCOE8Ao02vwGPbjvDyBI34FSbX9FbXR/3JlUnpzXIljCqEf/li3S+RLj7K+XGV7YlqMC1I8rcaez4ghFeBlXd2kDPHox7PN7EVVp4wGNb/C5lPdTiVyg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793126500; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MYyW/xXo/G0tg/sdPEATKJsUvKH9DdQaOm8Y83GXt/4=; 
	b=T94YV/chK+Iv5S/geQBaB+YmtLy5lGJyGydmRWmMFwEDRXmIpJ+I14K6rAEwXcd/SJsp0p38OIXvKoZ4LS+JOtbzMJTbaDELeNhLXKQ4wQngI8f7mEUZ0HhwM0W6lqUcYQqNex5s9E7aP7Ab8Is09n9YoATlHclalcEAx7lA9TA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793126500;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MYyW/xXo/G0tg/sdPEATKJsUvKH9DdQaOm8Y83GXt/4=;
	b=HX36CgBntRO83dEzvItCs+Gi3zQZMUi95G3bJKqPPoo1VukVGVWXWkrcAePkBZfJ
	h0zvArAnlH/mW9Y35UAtAAWfhc4QV9IkV7+9Opmv7fw40Qi66qf6lcED2YydPuruGL3
	nWgsRuM3SvWigGLDOBQ5j8IK7k3W77o3kezV8Lnc=
Received: by smtp.zohomail.com with SMTPS id 1793126496897601.2942230974244;
	Tue, 27 Oct 2026 11:41:36 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	Michal Pecio <michal.pecio@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dennis Wissel <dennis@dsine.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH] xhci: keep ep0 blocked after disconnect until Address Device reloads it
Date: Tue, 27 Oct 2026 11:40:15 -0700
Message-ID: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
References: <20261027084845.1588204-1-yiyu@yiyuzhou.io> <842f8c77-ad37-4eea-9983-61a4086eaf5e@linux.intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On Tue, 27 Oct 2026 12:36:26 +0200, Mathias Nyman wrote:=0D
> There are cases where EP_DROP_PENDING won't be cleared at all in this pat=
ch.=0D
=0D
You are right.  xhci_setup_device() returns early with "Slot already in=0D
default state" for the SETUP_CONTEXT_ONLY call from hub_enable_device(),=0D
before my new clear, and Reset Device leaves the slot in that state.  I=0D
missed that early return.  ep0 then stays blocked, and usbcore only gets=0D
out of it by re-enumerating the device.=0D
=0D
On Tue, 27 Oct 2026 11:58:05 +0100, Michal Pecio wrote:=0D
> You seem to suggest that xhci-hcd should trick usbcore into abandoning=0D
> "resuscitation", right?=0D
=0D
Yes, that was the effect, and I agree it is the wrong place for it.  It=0D
would also re-enumerate devices that recover from an in-place reset on=0D
7.2, which is a bigger change than I weighed.=0D
=0D
Please drop this patch.  I can't judge the controller side of the plan=0D
in your mail, but I am happy to test it.  My HHKB covers the original=0D
disconnect hang, and Dennis's Keychron covers the reset case.  If it=0D
helps, I can also turn steps 1 and 2 into an RFC to test with, unless=0D
you have already started on them.=0D
=0D
-YZ=0D
