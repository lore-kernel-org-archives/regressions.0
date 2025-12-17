Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E788E21772A
	for <regressions@lists.linux.dev>; Wed, 17 Dec 2025 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765957319; cv=none; b=R18p7DLPxcbm9LHUZSiVFdim115/cXofPZtZM12LYu56sB8XE4dGSI5c25CnDxY8qtLWbv3QraO0f8E+aTNcJCgX09GEcIg59E/JS9WbOlz46OynYU45kvv6DLPRtKrQAtSUj0utXoCIWRQGxjcBRxyeoNr3kmUDs9QnGDuuTCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765957319; c=relaxed/simple;
	bh=gc7s9z0mCMLd31I/fcVEjVE4T8EBwefE/UsTn3a39MM=;
	h=Message-Id:Mime-Version:In-Reply-To:From:Content-Type:Subject:
	 References:To:Cc:Date; b=Y2JgO8qTmHpgcmNdveac6GdZQwFmzx3VAuQ/rvd+LQnQwZKA8/8axIM5q5wb2jrCaT8U43hdY4oiwS9Pa94MH1jTwkqQPxIPvhI9HwkSe/vOn0GWb8JrjN4JnL1LMGTLuOi+17HHii2slvUVhY4ntEo9YTJYf2+gcMiAA7W+sT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=pass smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=17flrZ5b; arc=none smtp.client-ip=209.127.231.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fnnas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="17flrZ5b"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1765957272;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=gc7s9z0mCMLd31I/fcVEjVE4T8EBwefE/UsTn3a39MM=;
 b=17flrZ5bw8bwvwZO/SlGZAbNeEFOVEeiUimEpqj+S/T7G+2EQSxFVP5ZmvVHFOWIkr2oCZ
 uxjEO08K9h5Hic1KEDHdel9BXjgxdG++0mnTs56z00ON3MfVkquvZC865JW1E3IUSzhig/
 cZYVRR/bPQOjUAwqiiiWXAQIQ3MrEhp/CSG/ZTTp2xws5q5hFkzH9Sochnf7brAFsLloKi
 lRUY33obXL6Jh9Ky4roNk7Hv1uIB+YzygkoEO1SIu4WUkDJP9vxDw/RkFRgXsmkYpgwmfw
 qJP6lgZk58831oILc0wC7SyQnHdaUes9eGeXPllKg1SOk0uuO4fqk6BYg9sp+Q==
Message-Id: <edbb5ba0-454a-4929-84a0-2e5b40d3ec25@fnnas.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Received: from [192.168.1.104] ([39.182.0.136]) by smtp.feishu.cn with ESMTPS; Wed, 17 Dec 2025 15:41:10 +0800
In-Reply-To: <7cff4b89-eeff-4048-8af3-ef9d76bdedf8@molgen.mpg.de>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
Content-Transfer-Encoding: quoted-printable
From: "Yu Kuai" <yukuai@fnnas.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: Issues with md raid 1 on kernel 6.18 after booting kernel 6.19-rc1 once
User-Agent: Mozilla Thunderbird
References: <b3e941b0-38d1-4809-a386-34659a20415e@gmail.com> <8fd97a33-eb5a-4c88-ac8a-bfa1dd2ced61@fnnas.com> <619a9b00-43dd-4897-8bb0-9ff29a760f52@gmail.com> <f20c3a92-d562-4ac2-98b6-39ff4f3e3bbf@fnnas.com> <7cff4b89-eeff-4048-8af3-ef9d76bdedf8@molgen.mpg.de>
Content-Language: en-US
X-Lms-Return-Path: <lba+269425e97+717270+lists.linux.dev+yukuai@fnnas.com>
Reply-To: yukuai@fnnas.com
To: "Paul Menzel" <pmenzel@molgen.mpg.de>
Cc: <bugreports61@gmail.com>, <linux-raid@vger.kernel.org>, 
	<linan122@huawei.com>, <xni@redhat.com>, <regressions@lists.linux.dev>, 
	"Linus Torvalds" <torvalds@linux-foundation.org>, <yukuai@fnnas.com>
Date: Wed, 17 Dec 2025 15:41:08 +0800

Hi,

=E5=9C=A8 2025/12/17 15:33, Paul Menzel =E5=86=99=E9=81=93:
> Dear Kuai,
>
>
> Am 17.12.25 um 08:17 schrieb Yu Kuai:
>
>> =E5=9C=A8 2025/12/17 15:13, BugReports =E5=86=99=E9=81=93:
>>>
>>> ...
>>>
>>> We'll have to backport following patch into old kernels to make
>>> new arrays to assemble in old kernels. ....
>>>
>>> The md array which i am talking about was not created with kernel=20
>>> 6.19, it was created sometime in 2024.
>>>
>>> It was just used in kernel 6.19 and that broke compatibility with
>>> my 6.18 kernel.
>>
>> I know, I mean any array that is created or assembled in new kernels
>> will now have lsb field stored in metadata. This field is not
>> defined in old kernels and that's why array can't assembled in old
>> kernels, due to unknown metadata.
>>
>> This is what we have to do for new features, and we're planning to
>> avoid the forward compatibility issue with the above patch that I
>> mentioned.
> Is there really no way around it? Just testing a new kernel and being=20
> able to go back must be supported in my opinion, at least between one=20
> or two LTS versions.

As I said, following patch should be backported to LTS kernels to avoid the=
 problem.

https://lore.kernel.org/linux-raid/20251103125757.1405796-5-linan666@huawei=
cloud.com

>
>
> Kind regards,
>
> Paul

--=20
Thansk,
Kuai
