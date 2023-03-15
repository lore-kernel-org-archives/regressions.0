Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F242563
	for <regressions@lists.linux.dev>; Wed, 15 Mar 2023 08:05:38 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pcM8Y-0000P3-BO; Wed, 15 Mar 2023 09:05:30 +0100
Message-ID: <1f37c8d4-8a1d-bc06-5b65-9357a7766ad7@leemhuis.info>
Date: Wed, 15 Mar 2023 09:05:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 net 1/2] tcp: Fix bind() conflict check for dual-stack
 wildcard address.
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 Kuniyuki Iwashima <kuniyu@amazon.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>,
 Kuniyuki Iwashima <kuni1840@gmail.com>, netdev@vger.kernel.org,
 Paul Holzinger <pholzing@redhat.com>,
 Martin KaFai Lau <martin.lau@kernel.org>
References: <20230312031904.4674-1-kuniyu@amazon.com>
 <20230312031904.4674-2-kuniyu@amazon.com>
 <533d3c1a-db7e-6ff2-1fdf-fb8bbbb7a14c@leemhuis.info>
 <20230315002625.49bac132@kernel.org>
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20230315002625.49bac132@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1678867538;64330db2;
X-HE-SMSGID: 1pcM8Y-0000P3-BO

On 15.03.23 08:26, Jakub Kicinski wrote:
> On Sun, 12 Mar 2023 12:42:48 +0100 Linux regression tracking (Thorsten
> Leemhuis) wrote:
>> Link:
>> https://lore.kernel.org/netdev/CAG_fn=Ud3zSW7AZWXc+asfMhZVL5ETnvuY44Pmyv4NPv-ijN-A@mail.gmail.com/
>> [1]
>> Fixes: 5456262d2baa ("net: Fix incorrect address comparison when
>> searching for a bind2 bucket")
>> Reported-by: Paul Holzinger <pholzing@redhat.com>
>> Link:
>> https://lore.kernel.org/netdev/e21bf153-80b0-9ec0-15ba-e04a4ad42c34@redhat.com/
>> [0]
> 
> I tried to fix this manually when applying but:
>  - your email client wraps your replies
>  - please don't reply to patches with tags which will look to scripts
>    and patchwork like tags it should pull into the submission
>    (Reported-by in particular, here)

Sorry for the mixup and thx for letting me know, will simply quote my
suggestion next time, that should avoid both problems.

Ciao, Thorsten
