Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AB6311C1D
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 08:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755593819; cv=none; b=s3bILjz17TXecz0+gox5mtLVkQ11J0wMQ8IAByeduRzibgVBomTmlAJu2vqqau5ZV//uBSrM8T96U5yvnu5vNAE3u5+J4FnI3VgZSQp99e2dE23UlC9KV2Zsr4u+sYoptkbq5uXUlAzV6sENLHIAqDQUd0ZHxqisO8xjfYvlUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755593819; c=relaxed/simple;
	bh=6a8laetZdfI/EmW85Ejs9Q7D81ghz8COfCPeHQVxhwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tq6aVFtrvU8isngCc9EBfxhQic6QWzNFlH0PK/qv5tMYeieyCnorRTS2H0Bca3PvJWyCKcrOeelIFRdeezgDX7gKi5Om/ZlPo+rjCaEHKm/J4KAwD/SYh8z1jz1G7a5+hXCqaT9HBgQUxi4KTNyw3GBPdUHZsLINdCx0Rdkd+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P82NSUL0; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P82NSUL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755593817; x=1787129817;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6a8laetZdfI/EmW85Ejs9Q7D81ghz8COfCPeHQVxhwY=;
  b=P82NSUL0b+Ut3qsaTKbBCINrammJ1TDxGI+o+MWeV5tWVTKbfvDl9GpV
   TXa4LLIsN+zUrOeEVaNv3s18yd4FFMIdzAeUyX+qOPaisj1YqcscxjJXC
   g1PHpKnuW9huBivwga0ZgVTOI6uo072Sq7YD74V7ZoFTlpgxuSCPvWdHF
   yvRggPEjHsrp2neZSJTyqX1BSpBWDwLp8E9NQvZrs96XbxXNsSBEwAq1N
   oAW/bZWf1WQJ5SDFhqGBphzupXPDXAJWk0jlkeK6m4OwRwl9YxgnzPl0c
   3qvXlrhzg5qoumf1z+qTsvStiXWuvcjd5VRLj1RX6vUePvyRSpTnIWpJX
   A==;
X-CSE-ConnectionGUID: 96O3WTc7QECyONonUqnHHQ==
X-CSE-MsgGUID: rjtPdl1lTiyYfk4I2S43aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57544887"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="57544887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 01:56:56 -0700
X-CSE-ConnectionGUID: rNVOp52ZQqObxTQcvUahug==
X-CSE-MsgGUID: rvkKU3EMSWmN0I92cy/LsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="173023857"
Received: from mnyman-desk.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmviesa004.fm.intel.com with ESMTP; 19 Aug 2025 01:56:55 -0700
Message-ID: <2f2b66b5-d845-4e75-aaac-87974b592b4a@linux.intel.com>
Date: Tue, 19 Aug 2025 11:56:54 +0300
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION 6.16] xHCI host not responding to stop endpoint
 command after suspend and resume
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>,
 linux-usb@vger.kernel.org
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 regressions@lists.linux.dev, Christian Heusel <christian@heusel.eu>
References: <20250818231103.672ec7ed@foxbook>
 <20250819084153.2c13c187@foxbook>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20250819084153.2c13c187@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.8.2025 9.41, Michał Pecio wrote:
> On Mon, 18 Aug 2025 23:11:03 +0200, Michał Pecio wrote:
>> A bisect effort is ongoing and c0c9379f235d ("Merge tag 'usb-6.16-rc1'
>> of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb") is bad,
>> so that's where the bug likely came from.
> 
> Looks like the result is in.
> 
> e1db856bd28891d70008880d7f1d3b8d1ea948fd is the first bad commit
> commit e1db856bd28891d70008880d7f1d3b8d1ea948fd
> Author: Niklas Neronin <niklas.neronin@linux.intel.com>
> Date:   Thu May 15 16:56:14 2025 +0300
> 
>      usb: xhci: remove '0' write to write-1-to-clear register

Thanks for tracking this down, I see the issue now

We may lose interrupts due to this patch, example:

Hardware sets IMAN_IP BIT(0) when in needs attention
Driver later allows xHC interrupt by setting IMAN_IE BIT(1), but
Driver clears IMAN_IP (RW1C) when setting IMAN_IE so no interrupt is triggered.
  
interrupts are only triggered if both IMAN_IE and IMAN_IP are set, (and some other
moderation and event handling bits are correct)

we need to make sure we don't accidentally clear a pending interrupt (IMAN_IP)
in both the enable and disable case.

Thanks
Mathias


