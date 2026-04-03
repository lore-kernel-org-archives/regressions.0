Received: from mx-2023-1.gwdg.de (mx-2023-1.gwdg.de [134.76.10.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDF73C6A51
	for <regressions@lists.linux.dev>; Fri,  3 Apr 2026 16:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.76.10.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775234059; cv=none; b=dr5j6YNYsMU1rPUxDGe6VscYldQ1n0hbNIOqx2SVRyE1dMQNjN43b/zbIWhp5x08OPc8ejSwytaGFRCN5zZEmrs6ov6igvB0T2/u04x/hkP2QL9E+sT58Da7anGrwzxtrhqDCRO1aXDBu1wi7iqSnkLAticZ5vQxepOIYJIWaSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775234059; c=relaxed/simple;
	bh=PfnnoFOWm8hG+YfpsBie9s/BDo0/AA/o+tQ5LtFJ4YE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GSOk9o4yl3kvKEb/FnMQB1HY+QOx9iv9cwAC10h05I7WMrsV83J6juQ8yEmE7mWeI+YwKhK9e5sQJENP342Vb0jS44FtEALbmWKkuoNSNawUdNEBKvwzlIcrq0iIiYEg0Yd1ghKy7WTKxD+C3ZARjrb66g+5wxrhq0Pq4w5mEH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de; spf=pass smtp.mailfrom=ipp.mpg.de; dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b=VW7AzNtL; arc=none smtp.client-ip=134.76.10.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ipp.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ipp.mpg.de header.i=@ipp.mpg.de header.b="VW7AzNtL"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ipp.mpg.de;
	s=2023-rsa; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:CC:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=u3lPbjPbt1nlOcXtgnGgEM37XILfZRiUU+Z9ZowCfiM=; b=VW7AzNtLjB3RijgcVWxo50/FgH
	rEDJ971E97UAXVi+dPc21zbACm4fOToLvfohn8mWFhl6RPSrByyZLkBQkVAXrAqEk73yYcVAYnwC1
	Mnhy57rtbnzfi0cfPFp8fvXu0liWte+JPk1SnNW3HXJpoCGL8bkG9aS80JQzhsvw+7vSQyD60v1+3
	PmLxUZvtpE/Wk80pw/kVhHOnDgrDqvhJqzkSvTGDzRsd/qgTOEuHP0QszamRdM6UWzrys3BbL10fl
	drYJi/imanQj4KRpLEBJwF1kuePXc3H1go8sZ0vqD+Q9ZNn8xcBop9BJ7wGLHNaZhrD48HE62vz0b
	GvTQL1Og==;
Received: from mailer.gwdg.de ([134.76.10.26]:44884)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1w8hTC-003JrV-1e;
	Fri, 03 Apr 2026 18:34:07 +0200
Received: from mbx19-sub-03.um.gwdg.de ([10.108.142.68] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <simon.fischer@ipp.mpg.de>)
	id 1w8hTD-0004l2-0u;
	Fri, 03 Apr 2026 18:34:07 +0200
Received: from [192.168.178.27] (10.250.9.200) by MBX19-SUB-03.um.gwdg.de
 (10.108.142.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.37; Fri, 3 Apr
 2026 18:34:06 +0200
Message-ID: <89a3874e-07cb-4dd5-8e90-e7163fa74acc@ipp.mpg.de>
Date: Fri, 3 Apr 2026 18:34:05 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
To: Greg KH <gregkh@linuxfoundation.org>
CC: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
 <2026040255-zone-chamomile-964f@gregkh>
From: Simon Fischer <simon.fischer@ipp.mpg.de>
In-Reply-To: <2026040255-zone-chamomile-964f@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MBX19-GWD-03.um.gwdg.de (10.108.142.56) To
 MBX19-SUB-03.um.gwdg.de (10.108.142.68)
X-Virus-Scanned: (clean) by clamav
X-Spam-Level: -

Hi Greg,

thanks for coming back! I will build and try it, has to wait for after 
the easter weekend. Will report back

kind regards

Simon

Am 02.04.2026 um 18:10 schrieb Greg KH:
> On Thu, Apr 02, 2026 at 03:34:35PM +0000, Fischer, Simon wrote:
>> Dear list,
>>
>> I've tried to dig deeper into the issues, tried different quirks and small patches, but was unable to solve this or find the root cause. As this seems to be a regression of 6.8 from 5.4, I hope this is the correct list?
> 6.8.1 is not supported by anyone but canonical, so there's not much we
> can do here, sorry as that is a very old and obsolete kernel missing
> tens of thousands of changes.
>
> Can you try running the latest 6.19 release instead?
>
> thanks,
>
> greg k-h

-- 
Simon Fischer

Entwickler - CoDaC
Department Operation
  
Max Planck Institut for Plasmaphysics
Wendelsteinstrasse 1

17491 Greifswald, Germany

Phone: +49(0)3834 88 1215

