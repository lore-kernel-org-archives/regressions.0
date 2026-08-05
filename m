Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF5F47ACFD;
	Wed,  5 Aug 2026 15:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944721; cv=none; b=g/eax8Zi6VlDEkiKZ+Yhcj80BH1CcUiwrls98ihioYjYZ67zLD+QSeSl7TDvA4JqMx0WdhrYjiW+NU1Tq476+GLutIwQeZhneksLZ+bi50JzeEcRbxS+y3LFzFs5jSo7msePnsXdD+Ax+UfNnq4+ljy3zGjUJ6JY+KOVy3aKGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944721; c=relaxed/simple;
	bh=e7XxFotGuFOBpsBqjcMVh3JT+Rft7GLqtR4Lq4n24L4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=G1B45hfw8vqOVb8UPWE/uMXby1tZoZmQ/FNQlZFVGuPyRoe6aeCZXP26PfG3DGItBCic0y4dGwwXhdnqd/xzFQWjMJbDnjFpwOy/3TvCms7xWSNGw8JDDDBS8zh3DRbnBPzXtF5LLu0pLDq8rIeP3EgCQO1Lb6yPOVjWijGxQIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ley7J1mE; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ley7J1mE"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hFZT7698Pz3vqh;
	Wed,  5 Aug 2026 17:43:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785944635;
	bh=e7XxFotGuFOBpsBqjcMVh3JT+Rft7GLqtR4Lq4n24L4=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ley7J1mEbqA3udJO3cZ8VtvW49dohCWytmxej9S+okpe2us7B7pm171QlnBUx9LxM
	 q7V1JpVTQonhSvbdFwVtLEbn9vTN1OY/m+WAvKb6dtH52y7C2ulFjMsrwig9nERLgX
	 SJgtqjOfzM7colZ6S37LkT2KAbm0F+VTXyIIBqquhGhMrq/W0BpykhOuPQJydWrvOn
	 EAfwYUCfCFLBMFVGz+Thy8luN1gw+q4eh3T9jyfXMempGQWBX8Xt7ToVvdmlQIr28I
	 4jtKbe/JfTr1Y8lUxkQe1W/V4bGCiStBYkowk1p9+KQ6G57IfQF1EbpyHZyVGXoKk0
	 d4AVfj+t7i2oQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hFZSk3xgYz3yKl;
	Wed,  5 Aug 2026 17:43:34 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hFZSj3Tt0z8sch;
	Wed,  5 Aug 2026 17:43:33 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 78DCC5FC77;
	Wed,  5 Aug 2026 17:43:28 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <25428915-b06b-4bdc-bc52-bc7f50e55db9@leemhuis.info>
Date: Wed, 5 Aug 2026 17:43:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] next/master: (build) use of undeclared identifier
 'check_vector_unaligned_access'; did ...
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <178543074351.4076.15027730787524065993@kernelci.org>
 <9d66c14c-5ef8-4e2e-aa1a-ece90901518c@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <9d66c14c-5ef8-4e2e-aa1a-ece90901518c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178594460877.2151836.6710921791439212242@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 78DCC5FC77
X-NC-CID: 9/f5E4Dv5k41ddZYOBQ8irrNBARcgK/N5Y76YMWpcM5JQ2FXInI=

On 7/31/26 11:43, Thorsten Leemhuis wrote:
> On 7/30/26 18:59, KernelCI bot wrote:
>> New build issue found on next/master:
> 
> Also reported by the "kernel test robot":
> https://lore.kernel.org/oe-kbuild-all/202607301618.yrE3EKfS-lkp@intel.com/
> 
> Fix is under review:
For the record, things were fixed differently in the end:

#regzbot resolve: fix was squashed (broke during a conflict resolution)

Full quote from
https://lore.kernel.org/all/8d641414-87eb-af9c-5341-07d25efa6cb4@kernel.org/

""Thanks, looks like I broke this during conflict resolution.  Sorry
about  that.  I squashed the fix into the original as you suggested.""
