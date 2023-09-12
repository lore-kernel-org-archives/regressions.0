Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843015AE
	for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 08:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694509110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Et4XrSW8efLvThc1V89jDZFB/myxZezLXAdDv36HbvY=;
	b=Vc5Sbm3TPiwZkCXKy5DfnS7iZk6zmm6Hl1UI3EpLPfOgcXE9wWYxnQSMER1CIMEtLNG0AI
	4zjQDHoe8vWGqYGFYvBObnkHs2iNqT5E/+Bbw9vOitoWkf4DGE8RJgyrUjzJRLiEESf1/w
	xcLN7vNnBoN+j1MsI9jTwq2teDoFpSE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-277-GeQb13YvOEy2WW9kTtExVA-1; Tue, 12 Sep 2023 04:58:29 -0400
X-MC-Unique: GeQb13YvOEy2WW9kTtExVA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9a9d7a801a3so353650366b.2
        for <regressions@lists.linux.dev>; Tue, 12 Sep 2023 01:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694509108; x=1695113908;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Et4XrSW8efLvThc1V89jDZFB/myxZezLXAdDv36HbvY=;
        b=ZIoZEgU0SIWpRl6KT4Ugo20q77wOo67nQn8M4J64mo2Le2FPTEU7/RfJmh8Ok2Hh80
         /kqCCDGx+6GZwSaBirDSXrqfaLcjw8aDtaRBeWJ3qtLxbgh1vs0hq/uF9ks8b210YcXA
         EB7Bgl92Lz3/se3JDtuVcpIDivdMIcV5+wOPEUKNHcHVkNP25uCZ9J4y45FFxy/5usEk
         rt3UAlKR7lOYi8bVM1jkRJ4VgUBrp0TdwncQ9J6IBj2zEvEU3evktlp84iI3GHF/pXQA
         aIDmh0MS53JZfrV8HFsUdZzNaAePFbhL3N5pMgKhuPHYLVUplZkd0ZtoYzbeHjG2yIzl
         fwsA==
X-Gm-Message-State: AOJu0YyK1nnk22TU/JBeZij6Y/CGf9q+OsiQYAgnOE+CfXIaYkfOvz/C
	6DxtKPHHa5hatQFB6rJHvdbMJQiCSZMwCzKAsyyQThvD/MThjcpLVNf7EFc+kIPCW4zTbEfAhU/
	/YQPvjlFHCIoWu3y1NRpZ+is=
X-Received: by 2002:a17:907:2c59:b0:9a1:af6f:e375 with SMTP id hf25-20020a1709072c5900b009a1af6fe375mr9077127ejc.35.1694509108239;
        Tue, 12 Sep 2023 01:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFGcKLf77LasWyQfqqzucp8Wj0iTzjDeVCvR4PK9N9Sl0R5dh6jR9ZhKvk/teVxGmkfyYmNg==
X-Received: by 2002:a17:907:2c59:b0:9a1:af6f:e375 with SMTP id hf25-20020a1709072c5900b009a1af6fe375mr9077114ejc.35.1694509107930;
        Tue, 12 Sep 2023 01:58:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gs9-20020a170906f18900b0099bd5d28dc4sm6585633ejb.195.2023.09.12.01.58.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 01:58:27 -0700 (PDT)
Message-ID: <4246946d-40e3-7df7-3fc4-9aa10e1dee10@redhat.com>
Date: Tue, 12 Sep 2023 10:58:26 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] pinctrl: amd: Add a quirk for Lenovo Ideapad 5
To: Linus Walleij <linus.walleij@linaro.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Shyam-sundar.S-k@amd.com, Basavaraj.Natikar@amd.com,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, lucapgl2001@gmail.com
References: <20230829165627.156542-1-mario.limonciello@amd.com>
 <20230829165627.156542-4-mario.limonciello@amd.com>
 <1d891d34-053a-368d-cf47-bcaf35284c79@redhat.com>
 <07353676-bad0-44f8-a15a-4877f1898b6b@amd.com>
 <811225f8-c505-7344-ac18-882472ee0348@redhat.com>
 <d232c11d-901f-4ebc-b408-bed042ed8da9@amd.com>
 <6734c409-89f1-89a1-3096-4054be29faf1@redhat.com>
 <f0ceff1c-ba5f-4c6b-ac0e-c4195f477500@amd.com>
 <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACRpkdYGxreyD8NVuKs2G44htR8EixdvGr3+ma=HrxHUP3NDQg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 9/12/23 09:08, Linus Walleij wrote:
> On Thu, Aug 31, 2023 at 7:53 PM Mario Limonciello
> <mario.limonciello@amd.com> wrote:
> 
>> Linus - please disregard version 1.
> 
> OK!
> 
>> I provided Luca a new series that implements this approach that Hans and
>> I discussed and they confirmed it works.
>>
>> I have some minor modifications to it to narrow where it's applied so we
>> don't have needless notifications and will send it for review after the
>> new modifications are tested as well.
> 
> OK standing by, I'll wait for Hans' ACK and then merge it for fixes.

AFAICT Mario has not posted a new version (yet),
so there is nothing for me to ack (yet).

Regards,

Hans


