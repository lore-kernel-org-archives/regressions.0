Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3700217996
	for <regressions@lists.linux.dev>; Thu,  3 Jul 2025 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751507739; cv=none; b=Ec6APeZA0ZGIzouCrl2hcMPYDTrZJ6VDl7U7Rv9GPWSkwyuLB8eGR54QhTKWDi2SPn0WNB5zo3oB8X/UBm9GN4I/8Dz7U51mfpSDkfrhUCr+LApr69tTqBne9O8UbXOurMqaQvKGrvCBjC1vW5n/K4vM1Y/Fm6BdA+Pm4k90Nrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751507739; c=relaxed/simple;
	bh=j8LXcvxJqKPrf3f1Q5p9MKANxva1tCdbVzUJ72APTT8=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=edni/wiZ/Maypkf1dv7oG7VP5gVOpY5j/DXC7/3gdtiW6+lfrQUaCEPms0Gg1E4Fgh2l1j5y5gmnbZ2tkd/7pzB9JDdvBVNc2rWbhb6ezByCHQ1KDkfZMWMfLOSRj5ZfsSv/JGhWgF/4eNtekLeuhV8zL9esrzIowGZtWb2gzII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rPy4JwQt; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rPy4JwQt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751507734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j8LXcvxJqKPrf3f1Q5p9MKANxva1tCdbVzUJ72APTT8=;
	b=rPy4JwQth9lDKYeQz2OVn/Iea7M5Zp0JkoinmmchrmgDeiBafY2QgDWrXcSxKhVuqAuAUI
	sG1E6ciKsErtvZ1g3B8/ouPY142CBnZv4wMvo3Ci2D52qqg3+mrd65nCMCrOJASPE9DDVN
	8VgskKxg04ql/Jp6qzvLz0JNNnglKXI=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3856.100.4\))
Subject: [REGRESSION] - Multiple userspace implementations of battery estimate
 broken after "ACPI: battery: negate current when discharging"
Message-Id: <87C1B2AF-D430-4568-B620-14B941A8ABA4@linux.dev>
Date: Wed, 2 Jul 2025 18:54:46 -0700
Cc: regressions@lists.linux.dev,
 stable@vger.kernel.org,
 rafael.j.wysocki@intel.com,
 linux-acpi@vger.kernel.org
To: pmarheine@chromium.org
X-Migadu-Flow: FLOW_OUT

Hello,

I installed kernel 6.15.4 to find that my battery estimate on my =
handheld gaming device was completely inaccurate, instead giving =
negative values and an unknown estimated battery life in multiple =
places.=20

After bisecting, I landed on "ACPI: battery: negate current when =
discharging=E2=80=9D as the bad commit. This commit breaks not one but =
several userspace implementations of battery monitoring: Steam and =
MangoHud. Perhaps it breaks more, but those are the two I have noticed =
so far.=20

Thanks,
Matthew Schwartz=
