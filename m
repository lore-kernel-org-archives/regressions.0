Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de [141.2.22.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE6A50
	for <regressions@lists.linux.dev>; Thu,  2 Jun 2022 16:42:31 +0000 (UTC)
Received: from smtpauth2.cluster.uni-frankfurt.de ([10.1.1.238])
	by mailout.rz.uni-frankfurt.de with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nwnu1-0004gT-Th; Thu, 02 Jun 2022 18:42:29 +0200
Received: from p57bcf53e.dip0.t-ipconnect.de ([87.188.245.62] helo=[192.168.2.17])
	by smtpauth2.cluster.uni-frankfurt.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nwnu1-0007WJ-S1; Thu, 02 Jun 2022 18:42:29 +0200
Message-ID: <c3b370a8-193e-329b-c73a-1371bd62edf3@med.uni-frankfurt.de>
Date: Thu, 2 Jun 2022 18:42:29 +0200
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
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
In-Reply-To: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

some more information:

$ cat /proc/version
Linux version 5.17.5 (root@dragon) (x86_64-pc-linux-gnu-gcc (Gentoo 
11.2.1_p20220115 p4) 11.2.1 20220115, GNU ld (Gentoo 2.37_p1 p2) 2.37) 
#130 SMP PREEMPT Thu Apr 28 10:50:24 CEST 2022

$ uname -mi
x86_64 GenuineIntel


I tried to compile 5.17.6 without the three mentioned diffs which
modify the following files:

   tools/objtool/check.c   and
   tools/objtool/elf.c      and
   tools/objtool/include/objtool/elf.h

and was then able to successfully boot 5.17.6.
