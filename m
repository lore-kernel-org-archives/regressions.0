Received: from mailout.rz.uni-frankfurt.de (mailout.rz.uni-frankfurt.de [141.2.22.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E893ED2
	for <regressions@lists.linux.dev>; Fri,  3 Jun 2022 13:46:37 +0000 (UTC)
Received: from smtpauth2.cluster.uni-frankfurt.de ([10.1.1.238])
	by mailout.rz.uni-frankfurt.de with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nx7dK-00007R-M8; Fri, 03 Jun 2022 15:46:34 +0200
Received: from p57bcf3b2.dip0.t-ipconnect.de ([87.188.243.178] helo=[192.168.2.17])
	by smtpauth2.cluster.uni-frankfurt.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <sattler@med.uni-frankfurt.de>)
	id 1nx7dK-0004S8-KY; Fri, 03 Jun 2022 15:46:34 +0200
Message-ID: <21de0fda-0ff0-a553-dae4-193eaec25ca3@med.uni-frankfurt.de>
Date: Fri, 3 Jun 2022 15:46:34 +0200
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
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
References: <11495172-41dd-5c44-3ef6-8d3ff3ebd1b2@med.uni-frankfurt.de>
 <YpkY0RLWki4PJ49y@kroah.com>
 <88b0eb42-41eb-af0e-285c-05f86a5c5fea@med.uni-frankfurt.de>
 <YpoFId6um9GaXKha@kroah.com>
From: Thomas Sattler <sattler@med.uni-frankfurt.de>
In-Reply-To: <YpoFId6um9GaXKha@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 03.06.22 um 14:57 schrieb Greg KH:
> On Fri, Jun 03, 2022 at 01:29:26AM +0200, Thomas Sattler wrote:
>> Am 02.06.22 um 22:08 schrieb Greg KH:
>>> On Thu, Jun 02, 2022 at 06:14:43PM +0200, Thomas Sattler wrote:
>>
>> Now, knowing that they were two patchsets, I compiled 5.17.12
>> twice, once without 60d2b0b1018a and once without d17f64c29512.
>>
>> And it turns out it is 60d2b0b1018a which breaks my system.
> 
> Does 5.18.1 also break for you?
> 

There is no difference between 5.17.6, 5.17.12 and 5.18.1:

   - they do not boot vanilla
   - applying ead165fa1042 is no help
   - reverting 60d2b0b1018a allows booting

Thomas
