Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D302CA2
	for <regressions@lists.linux.dev>; Tue, 11 Oct 2022 11:40:00 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oiDc6-0000Wf-6U; Tue, 11 Oct 2022 13:39:58 +0200
Message-ID: <80835d45-b023-acc9-cd7e-25fa8d66be63@leemhuis.info>
Date: Tue, 11 Oct 2022 13:39:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: CIFS: attempt to fix kernel bugzilla 215375
Content-Language: en-US, de-DE
To: Steve French <smfrench@gmail.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Davyd McColl <davydm@gmail.com>
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220906054240.4148159-1-lsahlber@redhat.com>
 <CAH2r5mu2sKKcf3H0wNYVUJgpVYLRSEPdu+PPiWZHJfNnV=aTNA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAH2r5mu2sKKcf3H0wNYVUJgpVYLRSEPdu+PPiWZHJfNnV=aTNA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1665488400;b6c08440;
X-HE-SMSGID: 1oiDc6-0000Wf-6U

On 10.09.22 17:19, Steve French wrote:
> Any thoughts about setting up VMs for Win98 to try this?  Any luck
> trying to test with the fix?

Ronnie, Steve, any news on that patch and a way forward? More and more
users are showing up in
https://bugzilla.kernel.org/show_bug.cgi?id=215375 and complain about
this regression. :-/ At least one of them apparently tested the patch
now successfully: https://bugzilla.kernel.org/show_bug.cgi?id=215375#c43

Ciao, Thorsten

> On Tue, Sep 6, 2022 at 12:42 AM Ronnie Sahlberg <lsahlber@redhat.com> wrote:
>>
>> Steve,
>> Here is an attempt to fix kernel bz 215375.
>> I can not test it, since I don't have access to servers this old but the change
>> should be safe for modern users as it only affects the password field for
>> "share mode" security, which we do not support anyway.
>>
>> It is only tested for regressions with user mode security on win98 and later systems, using ntlmssp
>> authentication.
>>
>>
>>
> 
> 
