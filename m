Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E389B39FD9;
	Thu,  8 Jan 2026 00:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767831706; cv=none; b=R3o0wcZuTrClIWuTEzaXT5Rm9CPk+/Bx64WdQaOXahJPROPfjKCL/jNWBsc+3NzeHHMHvY6eSgjrh2BicjgUcmd3gECm+YtyDS6YbOlWDu1LxcrASZzfqr/golb48TEI7u3h5xji1V6iGkbbBBy/RZ2RsPN2ucPdpgGzS/UkE08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767831706; c=relaxed/simple;
	bh=sCjaMtjAqSh7dHdG1AUNHQ2PyPynBnHCjXHB4bkvXIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DRuhHtcUbNrCSBaqvSiaoBtaPG9llfLUm/7A7wqcIAk8sDCXLPDdsf2DNi1osNDGIuPJhwcaiaFEtxIrrvwiwrwCLp7PcbQpcZcgtd5TxkigadzdLjeObWjO9tGnRDafqxorNx4itVSLvFHM4fyDKfz0f+5SwibTt2BKsv1zOq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qbX6eOpH; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qbX6eOpH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=PCVVTV8w/Ni3LkjH39EikR8LTZoksaNGfVOQ5bG+wng=; b=qbX6eOpHvLJ/HeVP0evVrn7mzW
	WhXwEUbHotY+x4kxb+q6o3qS1w/wvBwBQU34rTmp+UD4r5HHic/3aOHnNXlnIeba1VEQv0Z+YFFFL
	r+IAyvWnC8h2ElgyCVVC5nJKbGYOagbZf1G650EgfHintVmFpgVip8soa8MkQbZkrD4fQAKzuG8B3
	UMi9WpxInGbTewC85Tr0cJSFYjEo4IvhaNqvtnL7/8RADER5GD38CVtWs2dcMz0fCrzc8Mmzw3N9X
	j6vPe9LvQE5lcAgcHit3EKa+waTTqbGpgNCnOa9nIWEIXJA392CIomeiad1KnBIXqvggyIn7G9ozD
	IXXsmDyQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddmX-0000000FltD-19L1;
	Thu, 08 Jan 2026 00:21:41 +0000
Message-ID: <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>
Date: Wed, 7 Jan 2026 16:21:40 -0800
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
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aV7wTFqQQkGf4efF@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/7/26 3:46 PM, Bagas Sanjaya wrote:
> On Wed, Jan 07, 2026 at 10:19:32AM -0800, Randy Dunlap wrote:
>>
>>
>> On 1/7/26 5:08 AM, Bagas Sanjaya wrote:
>>> On Tue, Jan 06, 2026 at 02:58:43PM -0700, Jonathan Corbet wrote:
>>>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>>>>
>>>>> Hi,
>>>>>
>>>>> Building htmldocs on docs-next currenly produces about 50 new warnings; which
>>>>> all of them are unexpected section title on DOC: kernel-doc directive, like:
>>>>>
>>>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
>>>>>
>>>>> Userspace I/O
>>>>> ------------- [docutils]
>>>>> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section title.\n\nUserspace I/O\n-------------')
>>>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.
>>>>
>>>> So I did not, and do not, see any of these errors; are you doing
>>>> something special to get them?
>>>
>>> Nope.
>>>
>>> I'm running my htmldocs builds on my Arch Linux system (with Sphinx 9.0.4 and
>>> Python 3.13.11).
>>>
>>> Full log (tarred up) attached.
>>>
>>> Thanks.
>>
>> Hi,
>> What docutils version, please?
> 
> Mine have:
> 
> docutils (Docutils 0.21.2, Python 3.13.11, on linux)

I'm using docutils-3.13 (Docutils 0.22.3, Python 3.13.11, on linux)
and I don't see these warnings.
Maybe it's something that has been fixed between 0.21.2 and 0.22.3... ?

-- 
~Randy

