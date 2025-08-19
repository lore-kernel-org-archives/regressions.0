Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68C93451DA
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755594538; cv=none; b=k/0F3Lv8Lx4M0wFqT2hceUA9lgxzJmBNG21PpOiYJVP9wRbadEVbqwYDNtAuTQSWQEUAJ3jGPTd6ILO4fkXogQGrw6sR4fuKn4QB8mBeb/b3erEHaeM0T1qtTxX4SXYSkH2zF03dKTh7tUumA+e3QOv69TcBqIEK44f9zB5Qp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755594538; c=relaxed/simple;
	bh=Um6H15QTrz1VtvFLrWmOBXUQe9Tpje+hs4nXchQonZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mbC81pVXsEWNTKAH/I+BwSCbd62kyGsQrCTMqVLbB2W/4ARfkacaafeT/F+VtNPTwg9oHNxbfOs+WDy2EINoffJRxhGbMX8y8YsbewwW8kEj+mOZSahQArSt1lZ7qtshKEEJ7f8+6vY0cp1RltZKaifdK4Oy7KZYunXZag43Y+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIZUu4el; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIZUu4el"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755594537; x=1787130537;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Um6H15QTrz1VtvFLrWmOBXUQe9Tpje+hs4nXchQonZk=;
  b=iIZUu4elu5PY/KDz5Th8yHWMBztEbfUhiqvPiIfvXIZeVnNQ4ZjtASGI
   QGseQymqHXS0NpOTL/LNbXPoqN61bY3fp42ym6lUhh/UeSgVJf7Cy1WAm
   BJfRzFmiAt5ih2fM9KuBBucFW9IrBW8qoHbNlo2wGpe1lHvwi5//oYDKc
   lLht9BqPxhU8za0JQffpjf4ZMUl900y14IBSVuywNPz98jiQegNGT/Ggy
   WCCLFcfoIDmrhpSHanjuuLYScKdvZ8+KWIo1aE3mVcEOv48tXj+0cfqZ0
   mvh8qBfiXd2E5F6qswVI4Dhw1LzKbMx8jTkr4qxS9JGP+9GHcdqthUvo0
   Q==;
X-CSE-ConnectionGUID: hNAyobMeTn6rn4Vgi+S19w==
X-CSE-MsgGUID: Iatn8xzKTx6Z6qS/VQYcuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75404106"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75404106"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:08:56 -0700
X-CSE-ConnectionGUID: XGY+0hm6Q3OsRqFC/dLnww==
X-CSE-MsgGUID: +NA/tFbaQiSsN+JNURKLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="173156968"
Received: from nneronin-mobl1.ger.corp.intel.com (HELO [10.245.255.75]) ([10.245.255.75])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 02:08:55 -0700
Message-ID: <a036342a-a430-4dc6-94a2-abc12cd3dd0f@linux.intel.com>
Date: Tue, 19 Aug 2025 12:08:46 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 6.16] xHCI host not responding to stop endpoint
 command after suspend and resume
To: Mathias Nyman <mathias.nyman@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org
Cc: regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
References: <20250818231103.672ec7ed@foxbook>
 <20250819084153.2c13c187@foxbook>
 <2f2b66b5-d845-4e75-aaac-87974b592b4a@linux.intel.com>
Content-Language: en-US
From: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
In-Reply-To: <2f2b66b5-d845-4e75-aaac-87974b592b4a@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 19/08/2025 11.56, Mathias Nyman wrote:
> On 19.8.2025 9.41, Michał Pecio wrote:
>> On Mon, 18 Aug 2025 23:11:03 +0200, Michał Pecio wrote:
>>> A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
>>> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
>>> so that's where the bug likely came from.
>>
>> Looks like the result is in.
>>
>> e1db856bd28891d70008880d7f1d3b8d1ea948fd is the first bad commit
>> commit e1db856bd28891d70008880d7f1d3b8d1ea948fd
>> Author: Niklas Neronin <niklas.neronin@linux.intel.com>
>> Date:   Thu May 15 16:56:14 2025 +0300
>>
>>      usb: xhci: remove '0' write to write-1-to-clear register
> 
> Thanks for tracking this down, I see the issue now
> 
> We may lose interrupts due to this patch, example:
> 
> Hardware sets IMAN_IP BIT(0) when in needs attention
> Driver later allows xHC interrupt by setting IMAN_IE BIT(1), but
> Driver clears IMAN_IP (RW1C) when setting IMAN_IE so no interrupt is triggered.

Apologies for my blunder.

So, there can be an interrupt pending even when the interrupt is not enabled?
But there (ideally) should not be an interrupt pending when disabling the interrupt?

I can submit a fix patch.

Best regards,
Niklas

>  
> interrupts are only triggered if both IMAN_IE and IMAN_IP are set, (and some other
> moderation and event handling bits are correct)
> 
> we need to make sure we don't accidentally clear a pending interrupt (IMAN_IP)
> in both the enable and disable case.
> 
> Thanks
> Mathias
> 
> 

