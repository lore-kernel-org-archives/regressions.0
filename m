Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAC217BED0;
	Wed, 14 Jan 2026 04:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366540; cv=none; b=BI/mvxb/xHV31Maid++XxEx/Qyob1Frg1vWTlUC3ZdVBaB5heCvKCqUAj+RYHxcV61MP4RB8swWE6AlRVkj/cOTkZPKR6JQ0LtyKgAw3RUJH8bN8gm99dJ00RroaOgF+1gUXi0NJT9pdwIUaB10qTwZ7nvILIBEPU0qCmpjSOVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366540; c=relaxed/simple;
	bh=6bNoNhfGSawoIKXS0GSRGO73y2CDDuS0JxbIvtmRn4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RU2j6pmjonYU0ff8yar+z10oYTqHYYtNHCNW2Rfj24NO8EaPQGfj7UP5ft4yUQkEZd+SDkuRE2UhQ9MKM8jqXw4/x9y9+/i9qE+Bhz2ZAck7+6aCShcUfxt3XUkJdnANtz2iRuHTdUF6KwfEvJBwa4cfVpztmSco7XOT/p4+66A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UNu7wGro; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UNu7wGro"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qu6FVIzdAduCducxkqgiM7xxeKYjyI46yVkhQYKvzVk=; b=UNu7wGroxpAGSENIcX7Qjab27w
	qC+kDF8lWCs/xdzaEtQYkj1gMqX+74ICvCeqDyZ4jJDF32u/XB5szyP1+5IYs6Ejq0gjmcNJkLtwX
	hCl+vzpKxtDnG80fNwnXIBpNOZyG8pgXcgcqmOEL9934N7GVJEfp8SkglWq+1QO2ziHQw2mUcV9Jz
	MlCqzhWdFkeu697572EJnL3tuftJ4ZtHFq/8zad0JNXGNDV/9/esM+QJf3nV5nn9Cn+nYollhDafY
	nYZVGPJJnPWoawvQVNKUEfqw6vjeZ739+VZw/v0XPyVjd3KsinxtiaNVaHTGOZ1zKwe6Aa0nCphAf
	kMSzbKZg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfsug-000000084St-1dj1;
	Wed, 14 Jan 2026 04:55:22 +0000
Message-ID: <d82c0b7a-b568-4085-b1a8-0eb21bacdd79@infradead.org>
Date: Tue, 13 Jan 2026 20:55:21 -0800
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
 <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
 <aV7wTFqQQkGf4efF@archie.me>
 <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>
 <aWcHeGPUfS6nE2sC@archie.me>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aWcHeGPUfS6nE2sC@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/13/26 7:03 PM, Bagas Sanjaya wrote:
> On Wed, Jan 07, 2026 at 04:21:40PM -0800, Randy Dunlap wrote:
>> I'm using docutils-3.13 (Docutils 0.22.3, Python 3.13.11, on linux)
>> and I don't see these warnings.
> 
> What Sphinx version? Mine is 9.1.0.
> 

I'm using 8.2.3.

-- 
~Randy

