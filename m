Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05785369970;
	Wed,  7 Jan 2026 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767809979; cv=none; b=KZVdzNy5duWQgMQho44wZwG0d1Tr6ID82MuqzFly04yFF9+jswL9gLcsRk2onr07Xe+atwZzz9eBRcxAVmXGRmsLSO/EYDs47VYyN+fAJunRaQUdhCBtk3oLUwnB4MZDUugURU8Bu5hphc2QvdqEAeLJMnFygMx/8Un5k55wiIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767809979; c=relaxed/simple;
	bh=jsDx8MiquD+czz2s9Ms/jVpvTx9vge38UMcQ1jMaUpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/So1dtjWiAt0HnHxCqFCsAhEStoPxojdUhUFBfYYXqW5whUe39lnLFxMauks837y+EYumAC+vArV0Bc0H2IkvoTC++recZFdAdarM0raaOWo1aB3894lfv/08ByBpeQYcGHCBN180Zf4M9N2DNlE1POHvLklKEMO9sTPxY+IU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jg+H/rb9; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jg+H/rb9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=5b3y/tAAigWUAZJfVkbOPKY0nxREoUvePJBzTo29VXE=; b=jg+H/rb9ud+QXrcToBlog3mXq5
	zhP4xbwTPDEx2b3ePgMs08abmBL9A3mtdPmVwiQj/B8nax+mXiQ9p4V8/Jegv0RjXEOQtbiVPdtZi
	cXgEjMK0fAh21NyzM/dhgktjvgHB61qLmHs0c8aTSJrb86RklcRZo/fMckk4A9V/UL+ZJ6IZlWsw8
	NYyB4wZEtLiOHnPocJHQFa558ko0O3aIk0sCxzaP8ImIEKEZEtk+zUR+yPJ7Pn89QyWemJNV57QzQ
	Iqjhbk59eSG48s8BIVsWSIwDf26r9FK1YmWbwF3cURmmkTh8sGf8s/nezSahl7PDQsu9ouQxvDq78
	fcdoPj/g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdY86-0000000FTMY-1NIT;
	Wed, 07 Jan 2026 18:19:34 +0000
Message-ID: <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
Date: Wed, 7 Jan 2026 10:19:32 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
To: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <aUuLHzk5jdyBAxD7@archie.me> <87ikdecsj0.fsf@trenco.lwn.net>
 <aV5a6PCVrkRHwqt3@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aV5a6PCVrkRHwqt3@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/7/26 5:08 AM, Bagas Sanjaya wrote:
> On Tue, Jan 06, 2026 at 02:58:43PM -0700, Jonathan Corbet wrote:
>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>>
>>> Hi,
>>>
>>> Building htmldocs on docs-next currenly produces about 50 new warnings; which
>>> all of them are unexpected section title on DOC: kernel-doc directive, like:
>>>
>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
>>>
>>> Userspace I/O
>>> ------------- [docutils]
>>> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section title.\n\nUserspace I/O\n-------------')
>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.
>>
>> So I did not, and do not, see any of these errors; are you doing
>> something special to get them?
> 
> Nope.
> 
> I'm running my htmldocs builds on my Arch Linux system (with Sphinx 9.0.4 and
> Python 3.13.11).
> 
> Full log (tarred up) attached.
> 
> Thanks.

Hi,
What docutils version, please?

-- 
~Randy

