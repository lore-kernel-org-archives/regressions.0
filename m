Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C99658
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 04:50:18 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o39MZ-0007A2-Mm; Mon, 20 Jun 2022 06:50:11 +0200
Message-ID: <1198479a-ed0a-ae45-4aef-d750113aa3b0@leemhuis.info>
Date: Mon, 20 Jun 2022 06:50:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Andrea Mayer <andrea.mayer@uniroma2.it>,
 Anton Makarov <am@3a-alliance.com>
Cc: David Ahern <dsahern@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, david.lebrun@uclouvain.be,
 regressions@lists.linux.dev, stable@vger.kernel.org,
 Stefano Salsano <stefano.salsano@uniroma2.it>,
 Paolo Lungaroni <paolo.lungaroni@uniroma2.it>,
 Ahmed Abdelsalam <ahabdels.dev@gmail.com>
References: <7e315ff1-e172-16c3-44b5-0c83c4c92779@3a-alliance.com>
 <20220606143338.91df592bbb7dc2f7db4747e6@uniroma2.it>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [REGRESSION] net: SRv6 End.DT6 function is broken in VRF mode
In-Reply-To: <20220606143338.91df592bbb7dc2f7db4747e6@uniroma2.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1655700618;7f23d8ff;
X-HE-SMSGID: 1o39MZ-0007A2-Mm

On 06.06.22 14:33, Andrea Mayer wrote:
> On Fri, 3 Jun 2022 15:23:26 +0300
> Anton Makarov <am@3a-alliance.com> wrote:
> 
>> #regzbot introduced: b9132c32e01976686efa26252cc246944a0d2cab
>>
>> Seems there is a regression of SRv6 End.DT6 function in VRF mode. In the 
>> following scenario packet is decapsulated successfully on vrf10 
>> interface but not forwarded to vrf10's slave interface:
>>
>> ip netns exec r4 ip -6 nexthop add id 1004 encap seg6local action 
>> End.DT6 vrftable 10 dev vrf10
>>
>> ip netns exec r4 ip -6 route add fcff:0:4:200:: nhid 1004

#regzbot fixed-by: a3bd2102e4642

> thank you for reporting this issue. I am already working on a fix patch which I
> will send shortly.

@Andrea: when you fix a reported issue, next time please include a
"Link: <url>" that links to the report, as explained in the
documentation (see submitting-patches.rst). Linus wants these tags(¹)
and my regression tracking efforts rely on them (that'S why I had to
write this mail to tell regression tracking bot with above command that
the issue has been fixed). tia!

Ciao, Thorsten

(¹) see for example:
https://lore.kernel.org/all/CAHk-=wjMmSZzMJ3Xnskdg4+GGz=5p5p+GSYyFBTh0f-DgvdBWg@mail.gmail.com/
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/
