Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de [141.2.22.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630F7F
	for <regressions@lists.linux.dev>; Tue,  7 Jun 2022 11:40:14 +0000 (UTC)
Received: from smtpauth1.cluster.uni-frankfurt.de ([10.1.1.45])
	by mailout.rz.uni-frankfurt.de with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nyXZ5-00013t-LG; Tue, 07 Jun 2022 13:40:03 +0200
Received: from p57bcf684.dip0.t-ipconnect.de ([87.188.246.132] helo=[192.168.2.17])
	by smtpauth1.cluster.uni-frankfurt.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nyXZ5-0005DF-Jb; Tue, 07 Jun 2022 13:40:03 +0200
Message-ID: <4dc96ed3-169e-37b9-7b8f-85e58dca0bbf@med.uni-frankfurt.de>
Date: Tue, 7 Jun 2022 13:40:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: boot loop since 5.17.6
Content-Language: en-US
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <c3b370a8-193e-329b-c73a-1371bd62edf3@med.uni-frankfurt.de>
 <181a6369-e373-b020-2059-33fb5161d8d3@med.uni-frankfurt.de>
 <YpksflOG2Y1Xng89@dev-arch.thelio-3990X>
 <1f8a4bec-53bd-aaaa-49a7-b5ed4fc5ae34@med.uni-frankfurt.de>
 <a9a68c68-8830-2aa0-acbe-d5d3bb04968f@leemhuis.info>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
In-Reply-To: <a9a68c68-8830-2aa0-acbe-d5d3bb04968f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thorsten,

I just compiled 5.19-rc1 and my issue is solved there.

Thomas
