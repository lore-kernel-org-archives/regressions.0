Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BA51365
	for <regressions@lists.linux.dev>; Tue, 15 Feb 2022 07:51:53 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5aee0e.dynamic.kabel-deutschland.de [95.90.238.14])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BD95F61EA1928;
	Tue, 15 Feb 2022 08:51:44 +0100 (CET)
Message-ID: <55f5c077-061c-7e53-b02d-53dde1dd654f@molgen.mpg.de>
Date: Tue, 15 Feb 2022 08:51:44 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: New warning: ACPI: CEDT not present
To: Dan Williams <dan.j.williams@intel.com>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-acpi@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

#regzbot introduced: 2d03e46a4bad20191d07b83ec1242d5f002577be

Dear Dan,


On the Dell Latitude E7250, Linux 5.17-rc3 logs the warning below 
(`dmesg --level=warn`):

     ACPI: CEDT not present

I think commit 2d03e46a4bad (ACPI: Add a context argument for table 
parsing handlers), part of Linux since 5.17-rc1, is the reason.

If I understand it correctly, CEDT is not to be expected on older 
devices, so the warning is not justified. Can something be done about it?


Kind regards,

Paul
