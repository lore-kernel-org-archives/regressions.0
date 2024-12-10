Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEF4433CE
	for <regressions@lists.linux.dev>; Tue, 10 Dec 2024 03:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733799954; cv=none; b=FO55vH4+cbm6b7iQjjRbdp/ucioEHO3gkr6VbRhkW1+2n58blitjQrfh26QOYY+FVE1FpwkRp6I00VkScSkFC1BrsdY3JgmZ8hufHnroSsoU0YYkAwDSwja5SHa99mQlm/fxqkJYa2NR6ABJCoGbzimrH+6L0KSJflZf5x6sP14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733799954; c=relaxed/simple;
	bh=a5RNvN6yhOLuXXEML1NHR1gboygZM1ZBmD8hpgI1s5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F9/VMDW1tmFriovLt0iVGoVIMF1hWtqJ5kI7AQfl/jRhJGPIwIB1zhJkYhKKGxMnU8zFihMCwlU4IyHvQCsrdIXw+KX/PdecAS5L/xqitUdjY0gDan25X7p+zYUh4Eyu1K+XUp7QFUgtVzDg8QCKZfFB7ue6iwZmXCgMHGWnJb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=QIopZxWn; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="QIopZxWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1733799900;
	bh=a5RNvN6yhOLuXXEML1NHR1gboygZM1ZBmD8hpgI1s5k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=QIopZxWn1C9T5n0GBooMcuaMAC50BdURgnEBVo53LqD8yhMvQGdB17XBSegR/ERya
	 PtzNCl18rW6rCYNmmxR9H1+3MZEi9e6xSQqd2Kqw3pOz0q2ayJTRHN2SMsS7LXkwsc
	 i79vAu2gcxhnMD1jB46W3OgXWuNgi0PQsPJqo46I=
X-QQ-mid: bizesmtpip2t1733799891tx507g5
X-QQ-Originating-IP: vdtojL+6+pcHB7DVTA5S2d/v3jVV2NI9BE/6GpvodYs=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Dec 2024 11:04:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11641744602555595633
From: WangYuli <wangyuli@uniontech.com>
To: ulm@gentoo.org
Cc: helugang@uniontech.com,
	jkosina@suse.com,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	regressions@leemhuis.info,
	bentiss@kernel.org,
	jeffbai@aosc.io,
	zhanjun@uniontech.com,
	guanwentao@uniontech.com
Subject: Re: "[REGRESSION] ThinkPad L15 Gen 4 touchpad no longer works"
Date: Tue, 10 Dec 2024 11:04:43 +0800
Message-ID: <7DAFE6DAA470985D+20241210030448.83908-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <uikt4wwpw@gentoo.org>
References: <uikt4wwpw@gentoo.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: Mutteg8H72qDajYqujVPi4dXTr3VokEnl9qBVcNKOFytc+jbOg+c2A4g
	nQetRfc3+k+LM4KjwXvQIARj4hfWHP/p2YqtNB7CT0IDQKB1d3ivRxN2jVJratGfsRAwvP0
	gtVUFN5aMkGs8eMI6VXFkfAV8OAuglMjsVp+6R8ZUZEwvMTnjtTTYZUsD6IAD45PIdJHWtn
	25sZO+f69KX3lma/BuTjWz1Vt28X2pVhT48/0x9HusS8RXzmRAiMv+JXLM6UBSY0TAbMYpD
	9lFO+kh09xTwCN5E43JDfIu96T1B69SFTDtdCAxZvCUNgynuYc7BDtaU/IVTdZdaVsnNcQ7
	WRZUdfL2VAbjXai3kXY13Q7Xa7vUETEVQxykGkUvTfrtcK1fFhaXxtthSoJVW30ucQAVgcY
	51M9U8v/2FPOeB6ncZHESL7rbvZZI8YbTus+VXq/PP6BRBQzUo58n5yz/WEnMziemYlifQl
	1ZPiTx7g2mbeJJ7x7zE5t/PcR6YzdWWnxY7RlywwtmmVptOumBQRRoQjlNQXKcdzYPypgnZ
	hOZgbhRRTiy2ojGnJ/O0155VEJfr3E9jGKsUaQNgszA/cpiWX9bqttDvPcCCXwc4RtM+yOk
	mx2MvUn7RXqFAtjnrTZG1Qfgbiq3EcrHLaffuaMngFJtoTJvRqHmZ375MYNFGn15NC8SLP9
	oA55Cj8kb2Kb+VslifTcmpPwr1UCsx7Q0MRX4OrWHgJ9DSmIWksnrMEg8PiNpMOukcCTNA3
	uyMdYLZm9diaN23M96nbVvAlgTANe4qrakXt/jUBCKJXtr1zKSkMIriUgnPokoXpExYEUY6
	Y7mYDJlmWEl4lvg8ditoZoHFJ0tjevOSKLVK9BSz7Q1vMKFAGZRqmOF1C1qVgei6zA5fnxh
	vyPHzizVL4dDN9xMTB/SXz7AfvXWf33JlaDPbonXhujgz0eHshFukAcTofA29DtDBEiO3n/
	2kguxLL/2M29uvgMHOKDDlIJo1mqwGNLnEl7oZOGEljIvKw==
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0

Thanks to Jeffbai's reminder. And I apologize for the late reply to the bug report
by Ulrich Müller.

He Lugang has left our company, which explains why he hasn't responded to your
emails as they were sent to his old corporate email address.

As his good friend, former colleague, and one of kernel maintainer for another Linux
distribution, I understand the urgency of this issue.

I'm currently testing with the affected hardware and will provide a patch soon.

Regarding the temporary workaround for Gentoo, while reverting the previous changes
is a viable temporary solution, I'm committed to providing a more comprehensive fix
that supports both Lenovo ThinkPad L15 Gen 4 and Lenovo Y9000P 2024.

Thank you all for your patience and understanding.

Thanks,
--
WangYuli
