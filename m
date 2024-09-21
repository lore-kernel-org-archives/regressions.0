Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A231520DF4
	for <regressions@lists.linux.dev>; Sat, 21 Sep 2024 17:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726940548; cv=none; b=tPL2zEJPTcpsMK9HO+WSr6/bevsrPjSyhdBpP8OBfS4/LhSynRTSdeYoP+gPSPFdXoMXjzXVFjCzGCL1jXnFPTuX0TFuVLMN5tBblUyCVYuBx1hHI5F4XZhmm8xivtLN7I8v17bfdbyaZDm5XjWMIy2dltrbKU4brBWtvHa/db4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726940548; c=relaxed/simple;
	bh=JgrYoAupbc8OvNFMx54RNgfQybMF51dGHAZ6mKbefj0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k9JA0mAspV23vng7y44L/oXwjlmmgrjMwNjyFRXX5NwXFyas4rr0d2wx7nthu3UtdOk3Aoz1zpS8zsBuIgEOhfYh71q7IlXxnkEmMiO0o5pHF90c5MHmah6MQDrnwl5klehFFavW6dvZPd++/VSTitXwmd+S8W7Iij3oH1ZxRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QYPOApGw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QYPOApGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726940545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=JgrYoAupbc8OvNFMx54RNgfQybMF51dGHAZ6mKbefj0=;
	b=QYPOApGwCI/ug6D54DcTBCVV8+HgUzFrPoJc/lEvb4ys1xEDGusbpVuzvPaWjuM/egY37P
	zJW4gKLWW3pPsdh5PfVPS+Fgh03Q0KeSCXtvPcpX89Bgc5cZ5L2M7qG/smLBkHfpM/qc+s
	j9AY9uEZV2Y7Qd5nG/s+ObIu5ECGTF8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-OV-hIj_yODSGPZYktNB7Lw-1; Sat, 21 Sep 2024 13:42:24 -0400
X-MC-Unique: OV-hIj_yODSGPZYktNB7Lw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2d8ce69ed4cso3084745a91.0
        for <regressions@lists.linux.dev>; Sat, 21 Sep 2024 10:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726940543; x=1727545343;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgrYoAupbc8OvNFMx54RNgfQybMF51dGHAZ6mKbefj0=;
        b=ru+yqBzBQmlSvb2PD7+C1w5qRIUusrou+QT6YV+VHQvkZWlJO1hHPfyCJhlRN6GLLW
         3i/SmhK587RUp0VWOzboN08szO9zU5KWGV8MfpOBSGq/Y/Rn+L9avkpw+A7eq/XBCEi1
         K5sOhTnF97mwQGXR6rTCrHbUXUBIaRYfg4ibBJJH2oDkSW4ajqjL+NyBH4inRny2Ejy4
         snaFi+t5TIz0C7w5L2LAMqeDaWIYqKYFsMpQ7PVpMGAO8VLE4Jb1QDgR4xjy0HfWwXUy
         yM9KhVhcEjs7qzn1iqBSxIeHIKjOE8jccmzu6hH/6nyhWT74JB1hMP2FfFF1nHZrkWcL
         cwsw==
X-Gm-Message-State: AOJu0YzjnpiSq7SF33YrmZeDdRovn+EGGPdKjC3v+AX2XKmWB360o+xg
	zevOzdE3kHCI/2BU3wXZIvoX0GN04X0qWYV2u5vg1kTa5gW3WapU7UjsVRc+8HYGBBPJ2qJ7kur
	7bDZFcLq5L8zwEXGo0xDSCJMecusaGS/qUjcep51Y94AiN2xW8AxB4qGfFhveABTps2GHLZmstZ
	w60NbqJHELg61BuprcxHpPTX3DEWd3PlPhYYk=
X-Received: by 2002:a17:902:e54b:b0:202:13ca:d73e with SMTP id d9443c01a7336-208d83b93fbmr96970205ad.28.1726940543362;
        Sat, 21 Sep 2024 10:42:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwKUefUGhW4P9+SPQMWxP6OdoTY4qumCwbgll/jbfjtlKNhI1zFL0C4CRiW+QJV0IQYuCYE57e7UXcnCMnUK8=
X-Received: by 2002:a17:902:e54b:b0:202:13ca:d73e with SMTP id
 d9443c01a7336-208d83b93fbmr96970035ad.28.1726940543063; Sat, 21 Sep 2024
 10:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Jason Montleon <jmontleo@redhat.com>
Date: Sat, 21 Sep 2024 13:42:11 -0400
Message-ID: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
Subject: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with FORTIFY_SOURCE enabled
To: linux-hardening@vger.kernel.org
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, kees@kernel.org, 
	linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

Starting with 6.11-rc1 I can no longer boot the Lichee Pi 4A with
FORTIFY_SOURCE enabled. This works on 6.10 up to at least 6.10.11.
However, with 6.11 I get no output at all from the kernel on the
serial console with FORTIFY_SOURCE enabled and the system never comes
online on network or otherwise as far as I can tell.

I did a bisect which led to:
2003e483a81cc235e29f77da3f6b256cb4b348e7
fortify: Do not special-case 0-sized destinations

If I revert this commit I can once again boot the Lichee Pi 4A with
FORTIFY_SOURCE enabled.

Thank you,
Jason Montleon

